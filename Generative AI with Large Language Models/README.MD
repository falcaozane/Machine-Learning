## Generative AI with Large Language Models - DeepLearning.AI

* Prompt Engineering: Prompt engineering involves crafting specific inputs (prompts) to guide LLMs in generating desired outputs effectively.
* Context Window: The context window is the amount of text that can be processed by the model at once, typically allowing for a few thousand words.
* Parameters: Parameters in LLMs represent the model's memory, with more parameters allowing for more sophisticated task performance.
* Large Language Models (LLMs): LLMs are machine learning models trained on vast datasets to generate human-like text by identifying statistical patterns.
* Inference: Inference is the process of using an LLM to generate text based on a given prompt, resulting in a completion that answers or expands on the prompt.

* Augmenting LLMs: Augmenting LLMs involves connecting them to external data sources or APIs to enhance their capabilities and provide real-time information.
* Text Generation Tasks: LLMs can perform various text generation tasks, such as writing essays, summarizing dialogues, and translating languages, showcasing their versatility.
* Model Size and Language Understanding: The understanding of language in LLMs improves with the scale of the model, as larger models can capture more complex language patterns.
* Next Word Prediction: Next word prediction is the foundational concept behind LLMs, enabling them to generate text by predicting the next word based on the context provided.
* Named Entity Recognition: Named entity recognition is a task where LLMs identify and classify entities in text, such as people and places, demonstrating their understanding of language.

* Recurrent Neural Networks (RNNs): RNNs are a type of neural network architecture that processes sequences of data, but they are limited by their ability to remember long-term dependencies due to their architecture.
* Attention Mechanism: The attention mechanism enables models to focus on specific parts of the input data, improving their ability to understand and generate language by considering the context of words.
* Syntactic Ambiguity: Syntactic ambiguity occurs when a sentence can be interpreted in multiple ways, highlighting the complexity of human language and the challenges faced by algorithms in understanding it.
* Transformer Architecture: The transformer architecture, introduced in the paper 'Attention is All You Need', allows for efficient parallel processing of data and utilizes attention mechanisms to better understand context in language.

* Embedding Layer: The embedding layer transforms token IDs into high-dimensional vectors, capturing the meaning and context of words in a continuous vector space.
* Tokenization: Tokenization is the process of converting words into numerical representations, allowing the model to process text as numbers rather than words.
* Self-Attention: Self-attention is a mechanism that allows the model to weigh the relevance of each word in a sentence to every other word, enhancing its understanding of context.
* Attention Weights: Attention weights are learned during training and indicate the importance of each word in the input sequence relative to all other words, facilitating better contextual understanding.
* Encoder and Decoder: The transformer architecture consists of an encoder and a decoder, which work together to process input data and generate output, sharing similarities in their structure.

* Decoder: The component that generates output tokens based on the encoded input and previous tokens, working in a loop until a stop condition is met.
* Tokenization: The process of converting input text into tokens that can be processed by the transformer model.
* Transformer Architecture: A neural network architecture designed for sequence-to-sequence tasks, consisting of encoder and decoder components that process input and generate output.
* Decoder-Only Models: Models that generate output based solely on previous tokens, commonly used for tasks like text generation.
* Encoder: The part of the transformer that encodes input sequences into a deep representation of their structure and meaning.
* Encoder-Decoder Models: Models that utilize both encoder and decoder components, effective for tasks where input and output sequences can differ in length.
* Softmax Layer: A final layer in the decoder that outputs probabilities for the next token in the sequence, allowing for token generation.

Attention is all you need paper : https://arxiv.org/abs/1706.03762

* Prompt: The text that you feed into the model to generate a response.
* One-Shot Inference: Providing a single example in the prompt to guide the model's response.
* In-Context Learning: Including examples of the task within the prompt to help the model learn better.
* Context Window: The full amount of text or memory available for use in the prompt.
* Zero-Shot Inference: A method where the model is asked to perform a task without any examples provided.
* Few-Shot Inference: Including multiple examples in the prompt to improve the model's understanding of the task.
* Fine-Tuning: Additional training on the model using new data to enhance its capabilities for specific tasks.

* Top-k Sampling: Limits the model's choices to the top k most probable tokens, allowing for some randomness while maintaining sensible output.
* Random Sampling: A technique that introduces variability by selecting words based on their probability distribution rather than always choosing the most probable word.
* Top-p Sampling: Restricts the model to tokens whose cumulative probabilities do not exceed a specified threshold p, enhancing output coherence.
* Greedy Decoding: A method where the model selects the word with the highest probability for next-word prediction, which can lead to repetitive outputs.
* Temperature: A parameter that influences the randomness of the model's output; higher values increase variability, while lower values make the output more deterministic.
* Configuration Parameters: These parameters are set during inference to control aspects like output length and creativity, distinct from training parameters.

