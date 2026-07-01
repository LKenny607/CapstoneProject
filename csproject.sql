-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 01, 2026 at 07:44 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `csproject`
--

-- --------------------------------------------------------

--
-- Table structure for table `answers`
--

CREATE TABLE `answers` (
  `id` int(11) NOT NULL,
  `student_id` int(11) DEFAULT NULL,
  `question_id` int(11) DEFAULT NULL,
  `selected_answer` char(1) DEFAULT NULL,
  `is_correct` tinyint(1) DEFAULT NULL,
  `answered_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `game_session`
--

CREATE TABLE `game_session` (
  `id` int(11) NOT NULL,
  `game_code` varchar(20) DEFAULT NULL,
  `game_status` varchar(20) DEFAULT 'Running',
  `winner_student` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `game_session`
--

INSERT INTO `game_session` (`id`, `game_code`, `game_status`, `winner_student`) VALUES
(1, 'TT-1093', 'Running', NULL),
(2, 'TT-8817', 'Running', NULL),
(3, 'TT-6752', 'Running', NULL),
(4, 'TT-9040', 'Running', NULL),
(5, 'TT-2736', 'Running', NULL),
(6, 'TT-8133', 'Running', NULL),
(7, 'TT-9525', 'Running', NULL),
(8, 'TT-7964', 'Running', NULL),
(9, 'TT-1064', 'Running', NULL),
(10, 'TT-9374', 'Running', NULL),
(11, 'TT-5208', 'Running', NULL),
(12, 'TT-9468', 'Running', NULL),
(13, 'TT-9022', 'Running', NULL),
(14, 'TT-6918', 'Running', NULL),
(15, 'TT-7758', 'Running', NULL),
(16, 'TT-7703', 'Running', NULL),
(17, 'TT-2682', 'Running', NULL),
(18, 'TT-8204', 'Running', NULL),
(19, 'TT-4689', 'Running', NULL),
(20, 'TT-8105', 'Running', NULL),
(21, 'TT-6163', 'Running', NULL),
(22, 'TT-5665', 'Running', NULL),
(23, 'TT-8384', 'Running', NULL),
(24, 'TT-3043', 'Running', NULL),
(25, 'TT-7740', 'Running', NULL),
(26, 'TT-8106', 'Running', NULL),
(27, 'TT-6975', 'Running', NULL),
(28, 'TT-3738', 'Running', NULL),
(29, 'TT-8242', 'Running', NULL),
(30, 'TT-9275', 'Running', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` int(11) NOT NULL,
  `layer_number` int(11) DEFAULT NULL,
  `tile_number` int(11) DEFAULT NULL,
  `question_text` text DEFAULT NULL,
  `option_a` varchar(255) DEFAULT NULL,
  `option_b` varchar(255) DEFAULT NULL,
  `option_c` varchar(255) DEFAULT NULL,
  `option_d` varchar(255) DEFAULT NULL,
  `correct_answer` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `layer_number`, `tile_number`, `question_text`, `option_a`, `option_b`, `option_c`, `option_d`, `correct_answer`) VALUES
(61, 1, 1, 'What does the abbreviation AI stand for?', 'Artificial Intelligence', 'Automated Internet', 'Applied Information', 'Algorithmic Input', 'A'),
(62, 1, 1, 'AI refers to machines that are designed to do what?', 'Only store data', 'Simulate human-like thinking and decision making', 'Replace the internet', 'Print documents faster', 'B'),
(63, 1, 1, 'Which of the following is the best description of Artificial Intelligence?', 'A type of internet connection', 'Software that mimics human intelligence', 'A new programming language', 'A type of computer hardware', 'B'),
(64, 2, 1, 'Which field does Artificial Intelligence belong to?', 'Biology', 'Computer Science', 'Mechanical Engineering', 'Geography', 'B'),
(65, 2, 1, 'AI systems learn from what in order to improve their performance?', 'Random guesses', 'Data and experience', 'Human emotions', 'Physical sensors only', 'B'),
(66, 2, 1, 'Which of the following is NOT a branch of Artificial Intelligence?', 'Machine Learning', 'Natural Language Processing', 'Database Administration', 'Computer Vision', 'C'),
(67, 3, 1, 'The concept of AI was first formally proposed in which decade?', '1930s', '1950s', '1970s', '1990s', 'B'),
(68, 3, 1, 'Which term describes an AI that can perform any intellectual task a human can?', 'Narrow AI', 'Weak AI', 'General AI', 'Micro AI', 'C'),
(69, 3, 1, 'Machine Learning is best described as a subset of what?', 'Robotics', 'Artificial Intelligence', 'Database Management', 'Network Security', 'B'),
(70, 4, 1, 'What is the main goal of Artificial Intelligence research?', 'To build faster computers', 'To create machines capable of intelligent behaviour', 'To replace all human jobs', 'To develop new programming languages', 'B'),
(71, 4, 1, 'Which of the following distinguishes AI from traditional software?', 'AI always requires the internet', 'AI can learn and adapt from experience', 'AI only works on smartphones', 'AI never makes errors', 'B'),
(72, 4, 1, 'Which pioneer is widely credited with asking the question \"Can machines think?\"', 'Bill Gates', 'Alan Turing', 'Steve Jobs', 'John von Neumann', 'B'),
(73, 1, 2, 'What biological structure inspired the design of a neural network neuron?', 'Heart cells', 'Brain cells', 'Muscle fibres', 'Skin cells', 'B'),
(74, 1, 2, 'In a neural network, what does a single neuron receive as input?', 'Images only', 'Numerical values from other neurons', 'Sound waves', 'Text files', 'B'),
(75, 1, 2, 'What does a neuron produce after processing its inputs?', 'A new neuron', 'An output signal', 'A printed report', 'A database record', 'B'),
(76, 2, 2, 'In a neural network, what is the equivalent of a biological neuron called?', 'A node or unit', 'A pixel', 'A database row', 'A file', 'A'),
(77, 2, 2, 'What two components does a neuron use to compute its output?', 'Speed and memory', 'Weights and a bias', 'Color and size', 'RAM and CPU', 'B'),
(78, 2, 2, 'Which direction does information flow through a neuron during forward pass?', 'From output back to input', 'From input to output', 'Sideways between neurons', 'It does not move', 'B'),
(79, 3, 2, 'A neuron fires (activates) when its weighted sum exceeds what?', 'The learning rate', 'A threshold or bias value', 'The epoch count', 'The dataset size', 'B'),
(80, 3, 2, 'What happens to the output of a neuron before it is passed to the next layer?', 'It is deleted', 'It is passed through an activation function', 'It is stored in a database', 'It is printed to the screen', 'B'),
(81, 3, 2, 'Multiple neurons in the same layer are called what?', 'A stack', 'A column', 'A layer or cluster', 'A table', 'C'),
(82, 4, 2, 'Which mathematical operation does a neuron perform on its inputs and weights?', 'Exponentiation', 'Weighted sum (dot product)', 'Square root', 'Modulo division', 'B'),
(83, 4, 2, 'What is the bias term added to a neuron used for?', 'To slow down training', 'To shift the activation threshold', 'To reduce the number of layers', 'To store training data', 'B'),
(84, 4, 2, 'A perceptron is an early model of what?', 'A database table', 'A single artificial neuron', 'A type of activation function', 'A training algorithm', 'B'),
(85, 1, 3, 'Which is the first layer data passes through in a neural network?', 'Output layer', 'Hidden layer', 'Input layer', 'Bias layer', 'C'),
(86, 1, 3, 'What is the job of the input layer in a neural network?', 'To produce the final answer', 'To receive raw data and pass it forward', 'To store the model weights', 'To connect to the internet', 'B'),
(87, 1, 3, 'The number of neurons in the input layer usually matches what?', 'The number of output classes', 'The number of input features in the data', 'The number of hidden layers', 'The learning rate value', 'B'),
(88, 2, 3, 'Which statement about the input layer is correct?', 'It performs calculations on the data', 'It only receives data and passes it on unchanged', 'It applies an activation function', 'It updates weights during training', 'B'),
(89, 2, 3, 'If a dataset has 10 features per sample, how many neurons does the input layer typically have?', '1', '5', '10', '100', 'C'),
(90, 2, 3, 'The input layer does NOT perform which of the following?', 'Receiving raw feature values', 'Passing data to the next layer', 'Applying backpropagation', 'Holding one neuron per feature', 'C'),
(91, 3, 3, 'For an image of 28×28 pixels fed into a neural network, how many input neurons are typically needed?', '28', '56', '784', '1024', 'C'),
(92, 3, 3, 'Why is data normalisation important before feeding it into the input layer?', 'It makes images colourful', 'It ensures all input values are on a similar scale for stable training', 'It reduces the number of layers', 'It speeds up the internet connection', 'B'),
(93, 3, 3, 'Which type of data cannot be directly fed into the input layer without preprocessing?', 'Numerical values', 'Raw text strings', 'Floating point numbers', 'Binary values', 'B'),
(94, 4, 3, 'What preprocessing technique is commonly applied to input data before training?', 'Encryption', 'Normalisation or standardisation', 'Compression to MP3', 'Sorting alphabetically', 'B'),
(95, 4, 3, 'In a CNN, the input layer typically accepts data in which format?', 'A single number', 'A 3D tensor (height × width × channels)', 'A plain text string', 'A list of names', 'B'),
(96, 4, 3, 'One-hot encoding is used on the input layer to represent what kind of data?', 'Continuous numbers', 'Categorical or class labels', 'Image pixels', 'Audio frequencies', 'B'),
(97, 1, 4, 'In a neural network, what does a weight represent?', 'The colour of a node', 'The strength or importance of a connection', 'The speed of the CPU', 'The size of the dataset', 'B'),
(98, 1, 4, 'A higher weight value on a connection means what?', 'That input has less influence', 'That input has more influence', 'The neuron is deleted', 'The network restarts', 'B'),
(99, 1, 4, 'Weights in a neural network are adjusted during which process?', 'Data collection', 'Training', 'Deployment', 'Testing only', 'B'),
(100, 2, 4, 'How are weights typically initialised before training begins?', 'All set to 1', 'All set to 0', 'Set to small random values', 'Set to the learning rate', 'C'),
(101, 2, 4, 'What happens to a weight when the network makes an error during training?', 'It is deleted', 'It is adjusted to reduce the error', 'It stays the same', 'It doubles in value', 'B'),
(102, 2, 4, 'Which algorithm is responsible for updating the weights in a neural network?', 'Quicksort', 'Backpropagation with gradient descent', 'Binary search', 'Bubble sort', 'B'),
(103, 3, 4, 'If all weights in a network are initialised to the same value, what problem occurs?', 'The network trains faster', 'All neurons learn the same features (symmetry problem)', 'The loss becomes zero', 'The input layer disappears', 'B'),
(104, 3, 4, 'A weight of 0 on a connection effectively does what?', 'Doubles the input signal', 'Removes that connection\'s influence entirely', 'Increases the learning rate', 'Adds a bias to the neuron', 'B'),
(105, 3, 4, 'Which initialisation method helps prevent vanishing or exploding gradients?', 'All zeros', 'He or Xavier initialisation', 'All ones', 'Random large values', 'B'),
(106, 4, 4, 'The weight matrix between two layers has dimensions based on what?', 'The learning rate and batch size', 'The number of neurons in each of the two connected layers', 'The number of training epochs', 'The size of the dataset', 'B'),
(107, 4, 4, 'L2 regularisation penalises what to prevent overfitting?', 'Large bias values', 'Large weight values', 'Small learning rates', 'Large datasets', 'B'),
(108, 4, 4, 'Which term describes a weight that has become so small it no longer contributes to learning?', 'Dead weight', 'Exploding weight', 'Vanishing weight', 'Saturated weight', 'C'),
(109, 1, 5, 'What is the main purpose of an activation function in a neural network?', 'To delete unused neurons', 'To introduce non-linearity into the output', 'To store data permanently', 'To connect to the internet', 'B'),
(110, 1, 5, 'Without an activation function, a deep neural network behaves like what?', 'A random number generator', 'A simple linear model regardless of depth', 'A decision tree', 'A database', 'B'),
(111, 1, 5, 'Which of the following is an example of an activation function?', 'SQL', 'Sigmoid', 'HTML', 'FTP', 'B'),
(112, 2, 5, 'The Sigmoid activation function outputs values in which range?', '-1 to 1', '0 to 1', '0 to infinity', '-infinity to infinity', 'B'),
(113, 2, 5, 'Which activation function outputs the input directly if positive, and zero if negative?', 'Sigmoid', 'Tanh', 'ReLU', 'Softmax', 'C'),
(114, 2, 5, 'The Softmax activation function is typically used in which layer?', 'Input layer', 'Hidden layer', 'Output layer for classification', 'Weight layer', 'C'),
(115, 3, 5, 'What is the vanishing gradient problem associated with?', 'Using ReLU too often', 'Sigmoid and Tanh saturating at extreme values', 'Having too many output neurons', 'Using large datasets', 'B'),
(116, 3, 5, 'Which activation function is generally preferred in hidden layers of deep networks today?', 'Sigmoid', 'Tanh', 'ReLU', 'Step function', 'C'),
(117, 3, 5, 'The Tanh activation function outputs values in which range?', '0 to 1', '-1 to 1', '0 to infinity', '-infinity to infinity', 'B'),
(118, 4, 5, 'What is the \"dying ReLU\" problem?', 'ReLU outputs values greater than 1', 'Neurons output 0 for all inputs and stop learning', 'ReLU causes exploding gradients', 'ReLU slows down training', 'B'),
(119, 4, 5, 'Leaky ReLU was introduced to solve which problem?', 'Vanishing gradients in Sigmoid', 'Dying neurons in standard ReLU', 'Overfitting in output layers', 'Slow convergence in Softmax', 'B'),
(120, 4, 5, 'Which activation function should be used for binary classification output?', 'ReLU', 'Tanh', 'Sigmoid', 'Softmax', 'C'),
(121, 1, 6, 'What does ReLU stand for?', 'Rectified Linear Unit', 'Random Logic Update', 'Recursive Layer Utility', 'Real-time Learning Unit', 'A'),
(122, 1, 6, 'What does the ReLU function output when the input is negative?', '1', 'The input value unchanged', '0', '-1', 'C'),
(123, 1, 6, 'What does ReLU output when the input is positive?', 'Always 1', 'The input value itself', 'Always 0', 'The square of the input', 'B'),
(124, 2, 6, 'Which formula correctly describes the ReLU function?', 'f(x) = x²', 'f(x) = max(0, x)', 'f(x) = 1/(1+e^-x)', 'f(x) = |x|', 'B'),
(125, 2, 6, 'ReLU is computationally preferred over Sigmoid because it is what?', 'More accurate', 'Faster to compute and avoids vanishing gradients', 'Produces values between 0 and 1', 'Requires no training', 'B'),
(126, 2, 6, 'In which layers of a network is ReLU most commonly applied?', 'Only the input layer', 'Only the output layer', 'Hidden layers', 'Only convolutional layers', 'C'),
(127, 3, 6, 'How does Leaky ReLU differ from standard ReLU?', 'It outputs 1 for all positive values', 'It allows a small negative slope instead of outputting 0', 'It squares the input', 'It only works in the output layer', 'B'),
(128, 3, 6, 'The \"dying ReLU\" problem occurs when neurons always output what?', '1', 'Infinity', '0', 'Negative values', 'C'),
(129, 3, 6, 'Which variant of ReLU uses a learnable parameter for the negative slope?', 'Leaky ReLU', 'Parametric ReLU (PReLU)', 'ELU', 'Maxout', 'B'),
(130, 4, 6, 'ELU (Exponential Linear Unit) improves on ReLU by doing what for negative inputs?', 'Outputting 0', 'Outputting a smooth exponential curve instead of flat zero', 'Outputting the absolute value', 'Doubling the input', 'B'),
(131, 4, 6, 'Which property of ReLU helps with sparse activation in a network?', 'It outputs 1 for all inputs', 'Negative inputs become 0, deactivating those neurons', 'It normalises the output between 0 and 1', 'It multiplies all weights by 2', 'B'),
(132, 4, 6, 'GELU (Gaussian Error Linear Unit) is used in which modern architecture?', 'Basic perceptrons', 'Transformers and BERT', 'Decision trees', 'K-nearest neighbours', 'B'),
(133, 1, 7, 'What is forward propagation in a neural network?', 'Deleting old data', 'Passing input data through the network to produce an output', 'Reversing the network', 'Compressing images', 'B'),
(134, 1, 7, 'In forward propagation, data flows in which direction?', 'From output to input', 'From input layer through hidden layers to output layer', 'Sideways only', 'It does not move', 'B'),
(135, 1, 7, 'What is produced at the end of forward propagation?', 'Updated weights', 'A prediction or output value', 'A new training dataset', 'A random number', 'B'),
(136, 2, 7, 'Which operations are performed at each layer during forward propagation?', 'Sorting and filtering', 'Weighted sum followed by an activation function', 'Encryption and compression', 'Database queries', 'B'),
(137, 2, 7, 'Forward propagation is used during which phases of the network lifecycle?', 'Training only', 'Inference/prediction only', 'Both training and inference', 'Neither training nor inference', 'C'),
(138, 2, 7, 'What is the output of forward propagation compared against during training?', 'The learning rate', 'The true label to compute the loss', 'The number of layers', 'The weight initialisation', 'B'),
(139, 3, 7, 'In a dense layer, forward propagation computes output as what?', 'output = input / weight', 'output = activation(weight × input + bias)', 'output = input − weight', 'output = weight²', 'B'),
(140, 3, 7, 'Why is forward propagation needed before backpropagation during training?', 'To update the learning rate', 'To compute the prediction and loss that backprop will use', 'To reset the weights', 'To generate new training data', 'B'),
(141, 3, 7, 'The computation graph built during forward propagation is used by which process?', 'Data augmentation', 'Backpropagation to compute gradients', 'Model deployment', 'Hyperparameter tuning', 'B'),
(142, 4, 7, 'In matrix form, the forward pass of a dense layer is computed as what?', 'Z = X − W + b', 'Z = W · X + b then A = activation(Z)', 'Z = X / W', 'Z = W² + X', 'B'),
(143, 4, 7, 'What is a forward pass through an entire training dataset called?', 'An epoch', 'A batch', 'A step', 'A cycle', 'A'),
(144, 4, 7, 'In a deep network, why can forward propagation become computationally expensive?', 'Because of the size of the dataset name', 'Because each layer requires matrix multiplications that scale with layer size', 'Because activation functions are slow', 'Because the input layer is large', 'B'),
(145, 1, 8, 'What does a loss function measure in a neural network?', 'How fast the computer runs', 'The difference between the predicted output and the actual label', 'The number of layers', 'The size of the dataset', 'B'),
(146, 1, 8, 'A smaller loss value after training generally means what?', 'The model is performing poorly', 'The model predictions are closer to the true values', 'The dataset is corrupted', 'The network has too many layers', 'B'),
(147, 1, 8, 'During training, the goal is to do what to the loss value?', 'Maximise it', 'Minimise it', 'Keep it constant', 'Double it each epoch', 'B'),
(148, 2, 8, 'Which loss function is commonly used for binary classification problems?', 'Mean Squared Error', 'Binary Cross-Entropy', 'Hinge Loss', 'Cosine Similarity', 'B'),
(149, 2, 8, 'Mean Squared Error (MSE) is most commonly used for which type of problem?', 'Image classification', 'Regression (predicting continuous values)', 'Text generation', 'Clustering', 'B'),
(150, 2, 8, 'What does a loss of 0 theoretically mean?', 'The model failed completely', 'The model predictions perfectly match the true labels', 'Training has just started', 'The weights are all zero', 'B'),
(151, 3, 8, 'Categorical Cross-Entropy is used when the output has how many classes?', 'Exactly 2', 'More than 2 mutually exclusive classes', 'Only 1', 'An unlimited number', 'B'),
(152, 3, 8, 'Why should Mean Absolute Error (MAE) sometimes be preferred over MSE?', 'MAE is faster to compute', 'MAE is less sensitive to outliers than MSE', 'MAE always gives a lower value', 'MAE works for classification tasks', 'B'),
(153, 3, 8, 'The loss function provides what signal to the backpropagation algorithm?', 'The learning rate to use', 'The gradient direction for updating weights', 'The number of epochs needed', 'The size of each mini-batch', 'B'),
(154, 4, 8, 'Kullback-Leibler Divergence is used as a loss function to measure what?', 'Pixel differences in images', 'The difference between two probability distributions', 'The number of dead neurons', 'The training time', 'B'),
(155, 4, 8, 'Huber loss is designed to combine the benefits of which two loss functions?', 'Hinge loss and Cross-Entropy', 'MSE and MAE', 'Binary Cross-Entropy and Categorical Cross-Entropy', 'Cosine Similarity and L2 loss', 'B'),
(156, 4, 8, 'What happens to the loss landscape if the learning rate is set too high?', 'Training converges instantly', 'The optimiser may overshoot the minimum and diverge', 'The loss becomes negative', 'The loss stays constant', 'B'),
(157, 1, 9, 'Which algorithm is commonly used to minimise the loss function in neural networks?', 'Gradient Descent', 'Binary Search', 'Bubble Sort', 'Linear Search', 'A'),
(158, 1, 9, 'Gradient Descent works by moving in which direction along the loss surface?', 'Uphill (towards higher loss)', 'Downhill (towards lower loss)', 'Sideways', 'In a random direction', 'B'),
(159, 1, 9, 'What does the gradient in Gradient Descent represent?', 'The speed of the computer', 'The direction and rate of steepest increase of the loss', 'The size of the dataset', 'The number of neurons', 'B'),
(160, 2, 9, 'What is Stochastic Gradient Descent (SGD)?', 'Gradient Descent using the full dataset each step', 'Gradient Descent using one random sample per step', 'Gradient Descent with no learning rate', 'Gradient Descent that stops after one epoch', 'B'),
(161, 2, 9, 'Mini-batch Gradient Descent updates weights using what?', 'The entire training set at once', 'A single random sample', 'A small random subset of the training data', 'Only the validation set', 'C'),
(162, 2, 9, 'The learning rate in Gradient Descent controls what?', 'The number of layers in the network', 'How large each step towards the minimum is', 'The size of the training dataset', 'The number of output neurons', 'B'),
(163, 3, 9, 'What problem occurs when the Gradient Descent learning rate is too small?', 'The network trains instantly', 'Convergence is very slow and may get stuck', 'The loss increases rapidly', 'Weights become negative', 'B'),
(164, 3, 9, 'Which variant of Gradient Descent adds momentum to accelerate training?', 'SGD with no modification', 'Adam optimiser', 'Linear regression', 'K-means clustering', 'B'),
(165, 3, 9, 'The Adam optimiser combines Gradient Descent with which two concepts?', 'Momentum and learning rate decay', 'Momentum and adaptive learning rates', 'Weight decay and dropout', 'L1 and L2 regularisation', 'B'),
(166, 4, 9, 'A saddle point in the loss landscape is problematic because what?', 'The gradient is infinite', 'The gradient is zero but it is not a true minimum', 'The loss is negative', 'The weights explode', 'B'),
(167, 4, 9, 'Learning rate schedules are used in training to do what?', 'Increase the dataset size over time', 'Reduce the learning rate gradually as training progresses', 'Add more layers during training', 'Remove neurons after each epoch', 'B'),
(168, 4, 9, 'What is the difference between a local minimum and a global minimum in the loss surface?', 'They are the same thing', 'A local minimum is the lowest point in a region; the global minimum is the lowest point overall', 'The global minimum always has a higher loss', 'A local minimum only exists in 1D problems', 'B'),
(169, 1, 10, 'What is backpropagation used for in neural network training?', 'Sending emails', 'Updating weights by propagating the error backwards through the network', 'Backing up files', 'Restarting the network', 'B'),
(170, 1, 10, 'In which direction does backpropagation travel through the network?', 'Forward from input to output', 'Backward from output to input', 'Sideways between neurons', 'Randomly', 'B'),
(171, 1, 10, 'Backpropagation calculates how much each weight contributed to what?', 'The internet speed', 'The error or loss', 'The screen resolution', 'The student score', 'B'),
(172, 2, 10, 'Backpropagation relies on which mathematical rule to compute gradients through layers?', 'Product rule', 'Chain rule of calculus', 'Quotient rule', 'Power rule', 'B'),
(173, 2, 10, 'What does the gradient computed by backpropagation tell us about a weight?', 'Whether to delete the weight', 'How much and in which direction the weight should change', 'The weight\'s initial value', 'The weight\'s connection count', 'B'),
(174, 2, 10, 'Backpropagation is always run after which step in the training loop?', 'Initialising weights', 'Forward propagation and loss computation', 'Loading the dataset', 'Evaluating on the test set', 'B'),
(175, 3, 10, 'What is the vanishing gradient problem in backpropagation?', 'Gradients become infinitely large', 'Gradients become so small that early layers learn very slowly', 'The network forgets all weights', 'Backpropagation stops after one layer', 'B'),
(176, 3, 10, 'Which activation function is least likely to cause the vanishing gradient problem?', 'Sigmoid', 'Tanh', 'ReLU', 'Step function', 'C'),
(177, 3, 10, 'Exploding gradients during backpropagation can be controlled using what technique?', 'Increasing the learning rate', 'Gradient clipping', 'Adding more hidden layers', 'Reducing the dataset size', 'B'),
(178, 4, 10, 'In backpropagation, the partial derivative of the loss with respect to a weight is called what?', 'The weight update', 'The gradient of that weight', 'The bias correction', 'The activation value', 'B'),
(179, 4, 10, 'Batch Normalisation helps backpropagation by doing what?', 'Removing the need for activation functions', 'Normalising layer inputs to stabilise and speed up training', 'Reducing the number of parameters', 'Eliminating the need for a loss function', 'B'),
(180, 4, 10, 'Residual connections (skip connections) in ResNets help solve which backpropagation problem?', 'Exploding gradients only', 'Vanishing gradients in very deep networks', 'Slow data loading', 'Overfitting on training data', 'B'),
(181, 1, 11, 'What does the term \"epoch\" mean in neural network training?', 'One full pass through the entire training dataset', 'An error message', 'A type of neuron', 'A database table', 'A'),
(182, 1, 11, 'If you train for 10 epochs, how many times does the model see the full training dataset?', '1', '5', '10', '100', 'C'),
(183, 1, 11, 'Why do we train for multiple epochs instead of just one?', 'To make training faster', 'To allow the model to learn and refine its weights over multiple passes', 'To reset the weights each time', 'To reduce the dataset size', 'B'),
(184, 2, 11, 'What is one iteration (step) within an epoch?', 'One full pass through the dataset', 'Processing one mini-batch and updating weights once', 'One forward pass only', 'One backward pass only', 'B'),
(185, 2, 11, 'If the training set has 1000 samples and the batch size is 100, how many iterations are in one epoch?', '1', '10', '100', '1000', 'B'),
(186, 2, 11, 'Training for too many epochs without control can lead to what problem?', 'Underfitting', 'Overfitting', 'Faster convergence', 'Larger datasets', 'B'),
(187, 3, 11, 'Early stopping is a technique used to prevent what epoch-related problem?', 'Training for too few epochs and underfitting', 'Training for too many epochs and overfitting', 'Batch size being too large', 'Learning rate being too small', 'B'),
(188, 3, 11, 'What metric is typically monitored to decide when to stop training early?', 'Training loss only', 'Validation loss or validation accuracy', 'Number of parameters', 'Batch size', 'B'),
(189, 3, 11, 'Which of the following statements about epochs is correct?', 'More epochs always give better results', 'The optimal number of epochs depends on the dataset and model', 'One epoch is always sufficient', 'Epochs and batch sizes are the same thing', 'B'),
(190, 4, 11, 'What does a learning curve plot across epochs?', 'Weight values vs neuron count', 'Training and validation loss or accuracy over time', 'Dataset size vs model size', 'Layer depth vs output size', 'B'),
(191, 4, 11, 'A training loss that decreases but a validation loss that increases after many epochs indicates what?', 'The model is underfitting', 'The model is overfitting to training data', 'The learning rate is too small', 'The dataset is too large', 'B'),
(192, 4, 11, 'Cyclical Learning Rates change the learning rate within each epoch to do what?', 'Prevent the model from training', 'Help escape local minima and improve convergence', 'Increase the number of parameters', 'Reduce the dataset size', 'B'),
(193, 1, 12, 'What is overfitting in machine learning?', 'A model that performs well on training data but poorly on new unseen data', 'A model too small to load', 'A dataset with no labels', 'A network with no layers', 'A'),
(194, 1, 12, 'A model that has memorised the training data instead of learning patterns is said to be what?', 'Underfitting', 'Overfitting', 'Well-generalised', 'Optimised', 'B'),
(195, 1, 12, 'Which of the following is a sign that a model is overfitting?', 'High training accuracy and high test accuracy', 'Low training accuracy and low test accuracy', 'High training accuracy and low test accuracy', 'Low training accuracy and high test accuracy', 'C'),
(196, 2, 12, 'Which technique randomly disables neurons during training to prevent overfitting?', 'Batch Normalisation', 'Dropout', 'Weight initialisation', 'Learning rate scheduling', 'B'),
(197, 2, 12, 'Adding more training data generally helps to reduce what problem?', 'Underfitting', 'Overfitting', 'Slow hardware', 'Database errors', 'B'),
(198, 2, 12, 'L1 and L2 regularisation help prevent overfitting by doing what?', 'Adding more neurons', 'Penalising large weight values', 'Increasing the learning rate', 'Removing the output layer', 'B'),
(199, 3, 12, 'What is data augmentation and how does it help overfitting?', 'Removing duplicate data to simplify the model', 'Creating modified copies of training data to increase dataset variety', 'Splitting data into more batches', 'Normalising all input features', 'B'),
(200, 3, 12, 'The difference between training accuracy and validation accuracy is called what?', 'The learning rate gap', 'The generalisation gap', 'The batch gap', 'The epoch gap', 'B'),
(201, 3, 12, 'Which regularisation technique sets some weight gradients to zero during training?', 'L2 regularisation', 'Batch Normalisation', 'Dropout', 'Early stopping', 'C'),
(202, 4, 12, 'Bias-variance tradeoff describes the relationship between what two model properties?', 'Speed and accuracy', 'Underfitting (high bias) and overfitting (high variance)', 'Layer count and neuron count', 'Learning rate and batch size', 'B'),
(203, 4, 12, 'Which cross-validation technique is most thorough for detecting overfitting on small datasets?', 'Hold-out validation', 'K-fold cross-validation', 'Single train-test split', 'No validation', 'B'),
(204, 4, 12, 'Weight decay is another name for which regularisation technique?', 'L1 regularisation', 'L2 regularisation', 'Dropout', 'Batch Normalisation', 'B'),
(205, 1, 13, 'What does the learning rate control in neural network training?', 'The size of steps taken towards minimising the loss during each update', 'The number of students in class', 'The colour scheme of the interface', 'The internet connection speed', 'A'),
(206, 1, 13, 'If the learning rate is set too high, what can happen during training?', 'The model trains perfectly', 'Training becomes unstable and may not converge', 'The model trains slower but more accurately', 'Nothing changes', 'B'),
(207, 1, 13, 'If the learning rate is set too low, what happens?', 'Training converges instantly', 'Training is very slow and may get stuck', 'The loss increases every epoch', 'The weights are reset', 'B'),
(208, 2, 13, 'Which value is generally considered a good default starting learning rate to try first?', '10', '1', '0.001', '0.5', 'C'),
(209, 2, 13, 'Learning rate scheduling involves doing what to the learning rate during training?', 'Keeping it fixed throughout', 'Adjusting it (usually decreasing) as training progresses', 'Doubling it every epoch', 'Setting it to zero after 5 epochs', 'B'),
(210, 2, 13, 'Which optimiser automatically adapts the learning rate for each parameter?', 'Standard SGD', 'Adam', 'Batch Gradient Descent', 'Perceptron', 'B'),
(211, 3, 13, 'A learning rate that is too large may cause the optimiser to do what?', 'Converge at the global minimum', 'Overshoot the minimum and oscillate or diverge', 'Train in fewer epochs', 'Ignore the validation set', 'B'),
(212, 3, 13, 'What is a learning rate warmup strategy?', 'Starting with a high learning rate and decreasing it', 'Starting with a very low learning rate and gradually increasing it at the start of training', 'Keeping the learning rate constant for the first half of training', 'Setting the learning rate based on the batch size', 'B'),
(213, 3, 13, 'The learning rate finder technique involves what?', 'Setting the learning rate to 1 always', 'Training briefly with increasing learning rates to find the best range', 'Removing the learning rate entirely', 'Using the loss to set the learning rate automatically', 'B'),
(214, 4, 13, 'Cyclical learning rates (CLR) vary the learning rate between what?', 'Zero and the number of epochs', 'A minimum and maximum bound cyclically during training', 'The batch size and dataset size', 'The input size and output size', 'B'),
(215, 4, 13, 'The linear scaling rule states that when batch size is multiplied by k, the learning rate should be what?', 'Divided by k', 'Also multiplied by k', 'Set to 0.001 regardless', 'Kept the same', 'B'),
(216, 4, 13, 'Cosine annealing as a learning rate schedule does what?', 'Keeps learning rate constant', 'Gradually reduces learning rate following a cosine curve', 'Randomly changes learning rate each epoch', 'Increases learning rate at the end of training', 'B'),
(217, 1, 14, 'What does CNN stand for?', 'Central Neural Node', 'Convolutional Neural Network', 'Compressed Neuron Network', 'Connected Node Network', 'B'),
(218, 1, 14, 'CNNs are especially well suited for processing which type of data?', 'Plain text only', 'Images and visual data', 'Audio files only', 'Database tables only', 'B'),
(219, 1, 14, 'What is the key operation that makes CNNs different from regular neural networks?', 'Matrix inversion', 'Convolution using filters', 'Random dropout', 'Batch normalisation', 'B'),
(220, 2, 14, 'What does a convolutional filter (kernel) do when applied to an image?', 'Resizes the image', 'Detects local patterns such as edges or textures', 'Converts the image to greyscale', 'Removes noise only', 'B'),
(221, 2, 14, 'What is the purpose of the pooling layer in a CNN?', 'To add more filters', 'To reduce the spatial dimensions of feature maps', 'To increase the number of parameters', 'To apply the activation function', 'B'),
(222, 2, 14, 'Max pooling selects what value from each pooling window?', 'The average value', 'The minimum value', 'The maximum value', 'A random value', 'C'),
(223, 3, 14, 'What does \"stride\" control in a convolutional layer?', 'The depth of the filter', 'How many pixels the filter moves at each step', 'The activation function used', 'The number of output classes', 'B'),
(224, 3, 14, 'Padding in a CNN is added to do what?', 'Increase the learning rate', 'Control the spatial size of the output feature map', 'Remove the pooling layer', 'Add noise to training data', 'B'),
(225, 3, 14, 'Transfer learning in CNNs involves what?', 'Training from scratch on a new dataset', 'Using a pretrained CNN\'s weights as a starting point for a new task', 'Removing all convolutional layers', 'Training on random data', 'B'),
(226, 4, 14, 'Which famous CNN architecture introduced residual (skip) connections?', 'VGG-16', 'AlexNet', 'ResNet', 'LeNet', 'C'),
(227, 4, 14, 'In a CNN, the receptive field refers to what?', 'The number of filters used', 'The region of the input that influences a particular output neuron', 'The stride value', 'The padding size', 'B'),
(228, 4, 14, 'Depthwise separable convolutions in MobileNet reduce what compared to standard convolutions?', 'Accuracy', 'Computational cost and number of parameters', 'Number of output classes', 'Dataset size required', 'B'),
(229, 1, 15, 'What is the output layer of a neural network responsible for?', 'Storing the dataset', 'Producing the final prediction or result', 'Connecting to Wi-Fi', 'Running the operating system', 'B'),
(230, 1, 15, 'For a problem that classifies images into 5 categories, how many neurons does the output layer typically have?', '1', '2', '5', '100', 'C'),
(231, 1, 15, 'In a regression task, how many neurons does the output layer typically have?', '1 (for a single continuous value)', 'As many as the number of training samples', '10 always', 'Equal to the number of hidden layers', 'A'),
(232, 2, 15, 'Which activation function is typically used in the output layer for multi-class classification?', 'ReLU', 'Sigmoid', 'Softmax', 'Tanh', 'C'),
(233, 2, 15, 'The Softmax function in the output layer ensures that all output values do what?', 'Sum to 0', 'Sum to 1 (forming a probability distribution)', 'Equal each other', 'Become negative', 'B'),
(234, 2, 15, 'For a binary classification task, which output layer configuration is typical?', '2 neurons with ReLU', '1 neuron with Sigmoid activation', '10 neurons with Softmax', 'No activation function', 'B'),
(235, 3, 15, 'The output of the neural network is compared to the true label using what?', 'The activation function', 'The loss function', 'The learning rate', 'The weight matrix', 'B'),
(236, 3, 15, 'In object detection models, the output layer produces what kind of output?', 'A single class label only', 'Bounding box coordinates and class probabilities', 'A greyscale image', 'A sequence of text', 'B'),
(237, 3, 15, 'Why should ReLU generally not be used in the output layer for classification?', 'ReLU is too slow', 'ReLU can produce unbounded positive values, not valid probabilities', 'ReLU requires too much memory', 'ReLU only works in hidden layers of CNNs', 'B'),
(238, 4, 15, 'In a sequence-to-sequence model, the output layer produces what at each time step?', 'A single number', 'A probability distribution over the vocabulary', 'An image patch', 'A weight update', 'B'),
(239, 4, 15, 'Temperature scaling in the output Softmax layer affects what?', 'The number of output neurons', 'How confident or uncertain the probability distribution looks', 'The learning rate', 'The batch size', 'B'),
(240, 4, 15, 'In generative models (GANs), the generator output layer typically uses which activation?', 'ReLU', 'Softmax', 'Tanh (to output values in range -1 to 1)', 'No activation', 'C');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` int(11) NOT NULL,
  `student_name` varchar(100) NOT NULL,
  `student_email` varchar(100) DEFAULT NULL,
  `layer_number` int(11) DEFAULT 1,
  `score` int(11) DEFAULT 0,
  `current_tile` int(11) DEFAULT 0,
  `laps_completed` int(11) DEFAULT 0,
  `qr_token` varchar(64) DEFAULT NULL,
  `STATUS` enum('Online','Offline') DEFAULT 'Online',
  `winner` enum('Yes','No') DEFAULT 'No',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `student_name`, `student_email`, `layer_number`, `score`, `current_tile`, `laps_completed`, `qr_token`, `STATUS`, `winner`, `created_at`) VALUES
(1, 'joe', '', 1, 0, 5, 0, 'fc9156c02416bad9879a62ce65684043', 'Online', 'No', '2026-06-29 04:08:47');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `answers`
--
ALTER TABLE `answers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `game_session`
--
ALTER TABLE `game_session`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `answers`
--
ALTER TABLE `answers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `game_session`
--
ALTER TABLE `game_session`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=241;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
