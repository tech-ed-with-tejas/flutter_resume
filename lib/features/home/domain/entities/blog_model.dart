class BlogModel {
  final String title;
  final String description;
  final String url;
  final String? imageUrl;

  const BlogModel({
    required this.title,
    required this.description,
    required this.url,
    this.imageUrl,
  });
}

// Placeholder Data
const List<BlogModel> kBlogs = [
  BlogModel(
    title: "Autogen Agents Framework Deep Dive",
    description: "A comprehensive look into the Autogen framework for building agentic AI systems.",
    url: "https://medium.com/@tejas-anantharam/autogen-agents-framework-deep-dive-8de6227f1944",
  ),
  BlogModel(
    title: "LangChain: A Python Library for Gen AI",
    description: "Exploring LangChain's capabilities for building powerful Generative AI applications.",
    url: "https://medium.com/@tejas-anantharam/langchain-a-python-library-for-gen-ai-application-93dee2a87179",
  ),
  BlogModel(
    title: "Pydantic: Fast Data Validation in Python",
    description: "How Pydantic simplifies data validation and settings management in Python projects.",
    url: "https://medium.com/@tejas-anantharam/pydantic-fast-data-validation-in-python-68a7132de0dd",
  ),
  BlogModel(
    title: "Principles for Effective Prompt Engineering",
    description: "Strategies to promote clarity and reduce hallucinations in LLM outputs.",
    url: "https://medium.com/@tejas-anantharam/principles-for-effective-prompt-engineering-promoting-clarity-and-reducing-hallucinations-50fab1c5337b",
  ),
  BlogModel(
    title: "Python UV: Package Manager for Python",
    description: "An introduction to UV, a new and fast package manager for the Python ecosystem.",
    url: "https://medium.com/@tejas-anantharam/python-uv-package-manager-for-python-a6eaf777415d",
  ),
  BlogModel(
    title: "Unlocking the Power of Firebase",
    description: "A comprehensive guide to understanding Firebase services and their integration.",
    url: "https://medium.com/@tejas-anantharam/unlocking-the-power-of-firebase-a-comprehensive-guide-to-understanding-firebase-and-its-services-c20abcd8e1d5",
  ),
  BlogModel(
    title: "Integrating ChatGPT API with Python",
    description: "Step-by-step process of integrating OpenAI's ChatGPT API into Python applications.",
    url: "https://medium.com/@tejas-anantharam/exploring-the-process-of-integrating-the-chatgpt-api-with-python-70a013e557af",
  ),
  BlogModel(
    title: "What is MLOps?",
    description: "Understanding the principles and practices of Machine Learning Operations.",
    url: "https://medium.com/@tejas-anantharam/what-is-mlops-b949f61e019c",
  ),
  BlogModel(
    title: "Deploying Docker Image on Cloud Run",
    description: "A guide to deploying containerized applications using Google Cloud Run.",
    url: "https://medium.com/@tejas-anantharam/deploying-docker-image-on-cloud-run-34023ace70fb",
  ),
  BlogModel(
    title: "Introduction to Google Cloud Platform",
    description: "An overview of GCP and its core services for cloud computing.",
    url: "https://medium.com/@tejas-anantharam/introduction-to-google-cloud-platform-and-its-services-1c6546cc11f2",
  ),
  BlogModel(
    title: "Python Data Structures: List",
    description: "A deep dive into Python Lists, their methods, and use cases.",
    url: "https://medium.com/python-in-plain-english/python-data-structures-list-bb6651937e3f",
  ),
  BlogModel(
    title: "NumPy: The Core of Scientific Computing",
    description: "Understanding NumPy arrays and their importance in data science.",
    url: "https://medium.com/python-in-plain-english/numpy-84fc03f7cb01",
  ),
  BlogModel(
    title: "My Blogging Journey",
    description: "Reflections and insights from my experience writing technical blogs.",
    url: "https://medium.com/@tejas-anantharam/blog-fdda3db7b1c0",
  ),
];
