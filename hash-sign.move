module HashSign::hash_sign_01 {
    use std::string::String;
    use std::vector;
    use aptos_framework::account;
    use aptos_framework::event;
    use aptos_framework::timestamp;
    use aptos_std::simple_map::{Self, SimpleMap};

    // Struct definitions with ability modifiers
    struct Document has store, drop, copy {
        id: u64,
        content_hash: String,
        creator: address,
        signers: vector<address>,
        signatures: vector<Signature>,
        is_completed: bool,
    }

    struct Signature has store, drop, copy {
        signer: address,
        timestamp: u64,
    }

    // Global store structure
    struct GlobalDocumentStore has key {
        documents: SimpleMap<u64, Document>,
        document_counter: u64,
    }

    // Event store structure
    struct EventStore has key {
        create_document_events: event::EventHandle<CreateDocumentEvent>,
        sign_document_events: event::EventHandle<SignDocumentEvent>,
    }

    // Event structures
    struct CreateDocumentEvent has drop, store {
        document_id: u64,
        creator: address,
    }

    struct SignDocumentEvent has drop, store {
        document_id: u64,
        signer: address,
    }

    // Module initialization function
    fun init_module(account: &signer) {
        move_to(account, GlobalDocumentStore {
            documents: simple_map::create(),
            document_counter: 0,
        });

        move_to(account, EventStore {
            create_document_events: account::new_event_handle<CreateDocumentEvent>(account),
            sign_document_events: account::new_event_handle<SignDocumentEvent>(account),
        });
    }

    // Public entry function to create a document
    public entry fun create_document(
        creator: &signer, 
        content_hash: String, 
        signers: vector<address>
    ) acquires GlobalDocumentStore, EventStore {
        // Get creator's address
        let creator_address = signer::address_of(creator);
        
        // Borrow mutable references to stores
        let store = borrow_global_mut<GlobalDocumentStore>(@HashSign);
        let event_store = borrow_global_mut<EventStore>(@HashSign);

        // Create new document
        let document = Document {
            id: store.document_counter,
            content_hash,
            creator: creator_address,
            signers,
            signatures: vector::empty(),
            is_completed: false,
        };

        // Add document to store
        simple_map::add(&mut store.documents, store.document_counter, document);

        // Emit creation event
        event::emit_event(
            &mut event_store.create_document_events, 
            CreateDocumentEvent {
                document_id: store.document_counter,
                creator: creator_address,
            }
        );

        // Increment document counter
        store.document_counter = store.document_counter + 1;
    }

    // Public entry function to sign a document
    public entry fun sign_document(
        signer: &signer, 
        document_id: u64
    ) acquires GlobalDocumentStore, EventStore {
        // Get signer's address
        let signer_address = signer::address_of(signer);
        
        // Borrow mutable references to stores
        let store = borrow_global_mut<GlobalDocumentStore>(@HashSign);
        let event_store = borrow_global_mut<EventStore>(@HashSign);

        // Validate document exists
        assert!(simple_map::contains_key(&store.documents, &document_id), 3);

        // Borrow mutable reference to document
        let document = simple_map::borrow_mut(&mut store.documents, &document_id);
        
        // Validate document not completed and signer is authorized
        assert!(!document.is_completed, 1);
        assert!(vector::contains(&document.signers, &signer_address), 2);

        // Create signature
        let signature = Signature {
            signer: signer_address,
            timestamp: timestamp::now_microseconds(),
        };

        // Add signature to document
        vector::push_back(&mut document.signatures, signature);

        // Emit signing event
        event::emit_event(
            &mut event_store.sign_document_events, 
            SignDocumentEvent {
                document_id,
                signer: signer_address,
            }
        );

        // Check if document is fully signed
        if (vector::length(&document.signatures) == vector::length(&document.signers)) {
            document.is_completed = true;
        }
    }

    // View function to get a specific document
    #[view]
    public fun get_document(document_id: u64): Document acquires GlobalDocumentStore {
        let store = borrow_global<GlobalDocumentStore>(@HashSign);
        
        // Validate document exists
        assert!(simple_map::contains_key(&store.documents, &document_id), 4);
        
        // Return document
        *simple_map::borrow(&store.documents, &document_id)
    }

    // View function to get all documents
    #[view]
    public fun get_all_documents(): vector<Document> acquires GlobalDocumentStore {
        let store = borrow_global<GlobalDocumentStore>(@HashSign);
        let all_documents = vector::empty<Document>();
        
        let i = 0;
        while (i < store.document_counter) {
            if (simple_map::contains_key(&store.documents, &i)) {
                vector::push_back(
                    &mut all_documents, 
                    *simple_map::borrow(&store.documents, &i)
                );
            };
            i = i + 1;
        };
        
        all_documents
    }

    // View function to get total number of documents
    #[view]
    public fun get_total_documents(): u64 acquires GlobalDocumentStore {
        let store = borrow_global<GlobalDocumentStore>(@HashSign);
        store.document_counter
    }
}