class ExperienceProject {
  final String title;
  final String description;
  final List<String> responsibilities;

  const ExperienceProject({
    required this.title,
    required this.description,
    this.responsibilities = const [],
  });
}

class ExperienceModel {
  final String company;
  final String role;
  final String duration;
  final String description;
  final List<String> technologies;
  final List<ExperienceProject> projects;

  const ExperienceModel({
    required this.company,
    required this.role,
    required this.duration,
    required this.description,
    required this.technologies,
    this.projects = const [],
  });
}
 
// Experience Data - Based on Tejas A Resume
const List<ExperienceModel> kExperiences = [
  ExperienceModel(
    company: "Saigeware (Healthcare Startup)",
    role: "Software Development Lead | AI & ML Engineer",
    duration: "Present",
    description:
        "Complete Ownership of a clinical research study managing stakeholder communication and reporting, coordinating with data collection and QA teams, performing statistical analysis, executing feature engineering, and developing predictive models.",
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
    projects: [
      ExperienceProject(
        title: "Product Vitalogy",
        description:
            "An audiology-focused platform for U.S. audiologists that stratifies patient hearing risk and provides deeper insights to support more accurate assessments and improved patient care.",
        responsibilities: [
          "Responsible for overseeing and developing the Flutter iOS application based on stakeholder requirements, while actively contributing to the app's overall development.",
          "Responsible for building an agentic system using LangChain and prompt engineering that interprets patient input, generates concise summaries, and identifies the appropriate patient category.",
        ],
      ),
      ExperienceProject(
        title: "Product Vitalogy Conversational App",
        description:
            "A conversation-driven data collection platform built using advanced prompting techniques and a LangGraph-based multi-agent system, featuring robust validation, session and state management, and memory handling.",
      ),
      ExperienceProject(
        title: "Product SAIWELL",
        description:
            "Led the development of a SaaS platform for patients, providers, and clinics. Acted as the main link between stakeholders and engineers, translating requirements into technical specs and managing the delivery timeline.",
        responsibilities: [
          "Backend Development: Built backend services using Flask and Firebase, integrated health data from Google Fit, Apple Health, and smart rings, payment gateway Stripe, and deployed Docker-based microservices on Google Cloud.",
          "Mobile & Hardware Integration: Directed iOS and Android app development with seamless smart ring connectivity and integration with Apple HealthKit and Google Health.",
          "Feature Delivery: Developed key modules such as booking, ordering, and notification management for patients, providers, and clinics.",
          "Testing & QA: Supported QA in creating and executing manual and automated tests using Python Selenium and dockerizing the testing process for Dev ops.",
          "API Integrations: Contributed to integrating third-party APIs, including weather services, device manufacturers, and EMR systems.",
        ],
      ),
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
    projects: [
      ExperienceProject(
        title: "Machine Learning-Based Prediction of Readmission Risk - Research Paper",
        description:
            "Developed and deployed end-to-end ML models to predict hospital readmission risk using EMR data in collaboration with Mayo Clinic. Built ETL pipelines (Pandas, BigQuery SQL), performed ANOVA and PCA, and designed one-to-one and one-to-many classification strategies. Gained strong understanding of CPT codes, RxNorm, facts, and flowsheet concepts. Trained optimized XGBoost models and deployed them via GCP containerized endpoints with a Streamlit interface for evaluation. Published results in a peer-reviewed journal, advancing healthcare AI research.",
      ),
      ExperienceProject(
        title: "Analysis of Phenotypic Markers",
        description:
            "Conducted advanced research on phenotypic markers and biomedical signals using TensorFlow and XGBoost to model complex biological patterns. Processed multimodal datasets (PPG, ECG, images) with Pandas, NeuroKit, opencv, dlib and NumPy to build reliable data pipelines. Developed end-to-end ML workflows incorporating ANOVA, Chi-square tests, PCA, MLflow-based experiment tracking on GCP. Deployed models as scalable Dockerized API endpoints on Google Cloud, enabling real-time inference and smooth system integration.",
      ),
      ExperienceProject(
        title: "Blood Pressure Estimation from PPG Signals",
        description:
            "Developed and deployed regression models to estimate blood pressure from PPG signals. Engineered key features from raw PPG data using NeuroKit to enhance model accuracy and generalization. Built a custom classifier to validate PPG wave cycles and applied statistical tests such as ANOVA for feature importance analysis. Designed robust preprocessing pipelines to manage noise and signal variability. Achieved low RMS and RMSE scores through experimentation with multiple regression techniques.",
      ),
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

