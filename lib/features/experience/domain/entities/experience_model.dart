class ExperienceModel {
   final String company;
   final String role;
   final String duration;
   final String description;
   final List<String> technologies;
 
   const ExperienceModel({
     required this.company,
     required this.role,
     required this.duration,
     required this.description,
     required this.technologies,
   });
 }
 
// Experience Data - Based on Tejas A Resume
const List<ExperienceModel> kExperiences = [
  ExperienceModel(
    company: "Saigeware (Healthcare Startup)",
    role: "Software Development Lead | AI & ML Engineer",
    duration: "Present",
    description:
        "Leading end-to-end development of healthcare AI products including agentic systems, predictive models, and mobile platforms. Owns clinical research studies, stakeholder communication, feature engineering, ML model development, and delivery of production-grade AI solutions.",
    technologies: [
      "Python",
      "Flutter",
      "LangChain",
      "LangGraph",
      "Machine Learning",
      "LLMOps",
      "Flask",
      "Firebase",
      "Docker",
      "Google Cloud",
      "RAG",
    ],
  ),

  ExperienceModel(
    company: "Saigeware (Healthcare AI Research)",
    role: "AI Software Engineer",
    duration: "2022 - 2024",
    description:
        "Developed and deployed ML models for hospital readmission risk prediction using EMR data in collaboration with Mayo Clinic. Worked on biomedical signal analysis, predictive modeling, experiment tracking, and deployment of scalable AI systems on GCP.",
    technologies: [
      "Python",
      "XGBoost",
      "TensorFlow",
      "Pandas",
      "MLflow",
      "NeuroKit",
      "OpenCV",
      "BigQuery",
      "Streamlit",
      "Docker",
      "Google Cloud",
    ],
  ),

  ExperienceModel(
    company: "Cognizant",
    role: "GCP Data Engineering Intern",
    duration: "2022 - 2022",
    description:
        "Worked on real-time data engineering platforms using GCP and Databricks. Built interactive dashboards and managed large-scale data workflows using SQL and Python.",
    technologies: [
      "Python",
      "SQL",
      "Google Cloud",
      "Databricks",
      "Plotly Dash",
    ],
  ),

 

  ExperienceModel(
    company: "Aquem",
    role: "Computer Vision Intern",
    duration: "December 2021 - January 2022",
    description:
        "Contributed to a virtual try-on computer vision system for e-commerce platforms and deployed a live demo on a cloud VM.",
    technologies: [
      "Python",
      "OpenCV",
      "Computer Vision",
      "Cloud Deployment",
    ],
  ),
   ExperienceModel(
    company: "Remocare",
    role: "AI Intern (Biomedical Signal Processing)",
    duration:"May 2021 -2021",
    description:
        "Focused on ECG signal processing, HRV feature extraction, and noise removal techniques. Developed REST APIs using Google Cloud Functions for healthcare data pipelines.",
    technologies: [
      "Python",
      "ECG Signal Processing",
      "HRV Analysis",
      "Google Cloud Functions",
      "REST APIs",
    ],
  ),
];

