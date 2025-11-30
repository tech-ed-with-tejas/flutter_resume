class ProjectModel {
   final String title;
   final String description;
   final List<String> tags;
   final String? demoUrl;
   final String? githubUrl;
   final String? imageUrl;
 
   const ProjectModel({
     required this.title,
     required this.description,
     required this.tags,
     this.demoUrl,
     this.githubUrl,
     this.imageUrl,
   });
 }
 
 // Mock Data
 const List<ProjectModel> kProjects = [
   ProjectModel(
     title: "Personal Project Tracker MCP",
     description: "A local Model Context Protocol server for tracking personal projects, integrating with VS Code and Claude.",
     tags: ["Python", "MCP", "SQLite", "FastAPI"],
     githubUrl: "https://github.com/tech-ed-with-tejas",
     demoUrl: "https://github.com/tech-ed-with-tejas", // Placeholder
   ),
   ProjectModel(
     title: "Prems Tofu E-Commerce",
     description: "A modern e-commerce platform for a Tofu brand with cart and order management.",
     tags: ["Flutter", "Firebase", "Stripe"],
     githubUrl: "https://github.com/tech-ed-with-tejas",
     demoUrl: "https://example.com/demo",
   ),
   ProjectModel(
     title: "AI Resume Builder",
     description: "An intelligent tool that helps users craft professional resumes using AI suggestions.",
     tags: ["React", "Node.js", "OpenAI API"],
     githubUrl: "https://github.com/tech-ed-with-tejas",
   ),
 ];
