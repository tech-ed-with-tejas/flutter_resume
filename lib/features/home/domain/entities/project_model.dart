class ProjectModel {
  final String title;
  final String description;
  final List<String> tags;
  final String? demoUrl;
  final String? githubUrl;
  final String? imageUrl;
  final String? projectImage; // New field for the project image

  const ProjectModel({
    required this.title,
    required this.description,
    required this.tags,
    this.demoUrl,
    this.githubUrl,
    this.imageUrl,
    this.projectImage, // Add to constructor
  });
}

// Personal / Independent Projects
const List<ProjectModel> kProjects = [
  ProjectModel(
    title: "AI Resume Builder",
    description:
        "AI-powered tool that generates resume sections and helps users rewrite and optimize content.",
    tags: ["React", "Node.js", "OpenAI API"],
    githubUrl: "https://github.com/tech-ed-with-tejas/Assigments/tree/main/ATS%20Resume%20Scoring%20",
    imageUrl: null,
    projectImage:
       "assets/images/AIresume.png",
  ),
    ProjectModel(
    title: "Multi-Agent Dietary Planning System",
    description:
        "A modular multi-agent system that generates personalized meal plans and nutrition guidance using advanced language models. Designed with specialized agents for analysis, goal tracking, meal plan generation, optimization, and continuous refinement. Focused on user-centric dietary recommendations, weight-loss planning, and extensible agent architecture.",
    tags: ["Multi-Agent", "AI", "Nutrition", "Python", "LLM"],
    githubUrl: "https://github.com/tech-ed-with-tejas/Assigments/blob/main/autogenassment0/readME.md",
    projectImage:
        "assets/images/nutrition.png",
  ),
    ProjectModel(
    title: "Personal Project Tracker MCP",
    description:
        "A local Model Context Protocol (MCP) server to track tasks, integrated with VS Code and Claude.",
    tags: ["Python", "MCP", "SQLite", "FastAPI"],
    githubUrl: "https://github.com/tech-ed-with-tejas/personaltasktrackermcp",
    projectImage:
        "assets/images/mcp.png",
  ),

  ProjectModel(
    title: "Glucose Estimation Using PPG",
    description:
        "Award-winning ML system using PPG and NIR signals for non-invasive glucose estimation, deployed on Raspberry Pi.",
    tags: ["Python", "Biomedical", "Raspberry Pi", "Signal Processing"],
    githubUrl: "https://github.com/tech-ed-with-tejas",
    projectImage:
        "assets/images/Glucometer.png",
  ),

  ProjectModel(
    title: "COVID-19 Chest CT Classifier",
    description:
        "ML model classifying COVID vs Non-COVID CT scans, published in the Emitter Journal.",
    tags: ["OpenCV", "ML", "Medical Imaging"],
    githubUrl: "https://github.com/tech-ed-with-tejas",
    projectImage:
       "assets/images/covid.png",
  ),


];
