import os
from dotenv import load_dotenv
import time
import subprocess

# load environment variables
load_dotenv()


# List of issues for all milestones
issues = [
    # Phase 1 (MVP)
    {
        "title": "Create UI for Fitness Tracking Dashboard",
        "body": "Design the Fitness Tracking dashboard interface. Includes progress, calories, workout summaries.",
        "labels": "Frontend",
        "milestone": "MVP"
    },
    {
        "title": "Implement Workout Log",
        "body": "Develop functionality for users to log workouts, including sets, reps, and cardio tracking.",
        "labels": "Frontend",
        "milestone": "MVP"
    },
    {
        "title": "Create UI for Meal Log",
        "body": "Design the Meal Log UI allowing users to manually track meals and calorie intake.",
        "labels": "Frontend",
        "milestone": "MVP"
    },
    {
        "title": "Implement Habit Tracking",
        "body": "Implement the Habit Tracker feature, allowing users to log and track daily habits with reminders.",
        "labels": "Frontend",
        "milestone": "MVP"
    },
    {
        "title": "Setup Google OAuth in Flutter",
        "body": "Implement Google OAuth authentication for user login via Google accounts.",
        "labels": "Auth",
        "milestone": "MVP"
    },
    {
        "title": "Setup Apple OAuth in Flutter",
        "body": "Implement Apple OAuth authentication for user login via Apple accounts.",
        "labels": "Auth",
        "milestone": "MVP"
    },
    {
        "title": "Setup SQLite for Local Storage",
        "body": "Set up SQLite for local storage to handle offline data for fitness, meal, and habit tracking.",
        "labels": "Database",
        "milestone": "MVP"
    },
    {
        "title": "Basic UI Design and Navigation",
        "body": "Create basic navigation across fitness, meals, and life tracking sections using Cupertino design.",
        "labels": "Frontend",
        "milestone": "MVP"
    },
    {
        "title": "Create UI for Life Tracking Dashboard",
        "body": "Design the Life Tracking dashboard, which includes an overview of habits, mood, sleep, and journaling.",
        "labels": "Frontend",
        "milestone": "MVP"
    },
    {
        "title": "Implement Mood Tracker",
        "body": "Develop functionality for users to track their mood throughout the day. Users should be able to input their mood and see a visual graph.",
        "labels": "Frontend",
        "milestone": "MVP"
    },
    {
        "title": "Implement Sleep Tracker",
        "body": "Allow users to log their sleep duration and quality. Display data on the Life Tracking dashboard.",
        "labels": "Frontend",
        "milestone": "MVP"
    },
    {
        "title": "Implement Journal Feature",
        "body": "Create a journaling feature where users can input daily reflections, edit and delete journal entries.",
        "labels": "Frontend",
        "milestone": "MVP"
    },
    {
        "title": "Progress Visualization for Fitness",
        "body": "Implement graphing functionality to visualize fitness progress over time using fl_chart.",
        "labels": "Frontend,Charts",
        "milestone": "MVP"
    },
    {
        "title": "Progress Visualization for Meals",
        "body": "Implement a graphical view of meal and nutrition tracking over time using fl_chart.",
        "labels": "Frontend,Charts",
        "milestone": "MVP"
    },
    {
        "title": "Meal Plan Creation Feature",
        "body": "Allow users to create and save meal plans. Users can input meals and associate them with specific days.",
        "labels": "Frontend,Meal Tracking",
        "milestone": "MVP"
    },
    {
        "title": "Basic Food Database Functionality",
        "body": "Set up a basic local food database that allows users to input food items manually. The database grows with usage.",
        "labels": "Database,Meal Tracking",
        "milestone": "MVP"
    },

    # Phase 2 (Web Backend & Cloud Sync)
    {
        "title": "Setup Laravel Backend for User Authentication",
        "body": "Set up a Laravel backend with MySQL to handle user authentication and account management.",
        "labels": "Backend",
       "milestone": "Web Backend & Cloud Sync"
    },
    {
        "title": "Subtask: Initialize Laravel Project",
        "body": "Set up the initial Laravel project structure with MySQL database connection.",
        "labels": "Backend,Database",
        "milestone": "Web Backend & Cloud Sync"
    },
    {
        "title": "Subtask: Implement User Registration & Login Routes",
        "body": "Create registration and login API routes using Laravel authentication scaffolding.",
        "labels": "Backend,Auth",
        "milestone": "Web Backend & Cloud Sync"
    },
    {
        "title": "Subtask: Set up Password Reset Functionality",
        "body": "Implement password reset flow using Laravel's built-in password reset functionality.",
        "labels": "Backend,Auth",
        "milestone": "Web Backend & Cloud Sync"
    },
    {
        "title": "Subtask: Role-based Access Control",
        "body": "Implement role-based access control to differentiate admin and regular users.",
        "labels": "Backend",
        "milestone": "Web Backend & Cloud Sync"
    },
    {
        "title": "Implement API for Data Sync",
        "body": "Create API endpoints in Laravel for syncing fitness, meal, and habit data.",
        "labels": "Backend,API",
        "milestone": "Web Backend & Cloud Sync"
    },
    {
        "title": "Subtask: Fitness Data Sync Endpoint",
        "body": "Create an API endpoint for syncing fitness data (workouts, calories, goals).",
        "labels": "Backend,API",
        "milestone": "Web Backend & Cloud Sync"
    },
    {
        "title": "Subtask: Meal Data Sync Endpoint",
        "body": "Create an API endpoint for syncing meal data (calories, macros, meal plans).",
        "labels": "Backend,API",
        "milestone": "Web Backend & Cloud Sync"
    },
    {
        "title": "Subtask: Habit Data Sync Endpoint",
        "body": "Create an API endpoint for syncing habit data (habits, reminders, goals).",
        "labels": "Backend,API",
        "milestone": "Web Backend & Cloud Sync"
    },
    {
        "title": "Cloud Sync for User Data",
        "body": "Enable cloud sync for users to back up and restore data from MySQL backend.",
        "labels": "Backend,Database",
        "milestone": "Web Backend & Cloud Sync"
    },

    # Phase 3 (Advanced Features)
    {
        "title": "Integrate Google Fit API",
        "body": "Integrate Google Fit API to automatically import user workout data.",
        "labels": "API,Fitness",
        "milestone": "Advanced Features"  # Advanced Features Milestone ID
    },
    {
        "title": "Subtask: Fetch Google Fit Workout Data",
        "body": "Use Google Fit API to fetch user workout data (steps, calories burned, workouts).",
        "labels": "API,Fitness",
        "milestone": "Advanced Features"
    },
    {
        "title": "Subtask: Sync Google Fit Data to Corpus Vitae",
        "body": "Sync the fetched workout data from Google Fit to Corpus Vitae.",
        "labels": "API,Fitness",
        "milestone": "Advanced Features"
    },
    {
        "title": "Integrate Apple Health API",
        "body": "Integrate Apple Health API to automatically import user workout data.",
        "labels": "API,Fitness",
        "milestone": "Advanced Features"
    },
    {
        "title": "Subtask: Fetch Apple Health Workout Data",
        "body": "Use Apple Health API to fetch user workout data (steps, calories burned, workouts).",
        "labels": "API,Fitness",
        "milestone": "Advanced Features"
    },
    {
        "title": "Subtask: Sync Apple Health Data to Corpus Vitae",
        "body": "Sync the fetched workout data from Apple Health to Corpus Vitae.",
        "labels": "API,Fitness",
        "milestone": "Advanced Features"
    },
    {
        "title": "Implement Notifications & Reminders",
        "body": "Allow users to set up and receive reminders for workouts, meals, and habits.",
        "labels": "Frontend",
        "milestone": "Advanced Features"
    },
    {
        "title": "Subtask: Create Reminder Setup UI",
        "body": "Create a user interface for setting up custom reminders for workouts, meals, and habits.",
        "labels": "Frontend",
        "milestone": "Advanced Features"
    },
    {
        "title": "Subtask: Implement Push Notification Service",
        "body": "Implement push notification service in Flutter for delivering workout, meal, and habit reminders.",
        "labels": "Frontend",
        "milestone": "Advanced Features"
    },

    # Phase 4 (Optimizations, UI Updates, AI)
    {
        "title": "AI-Powered Insights",
        "body": "Set up AI logic to generate personalized insights based on user fitness and nutrition data.",
        "labels": "AI,Backend",
        "milestone": "Optimizations, AI, and Gamification"  # Optimizations Milestone ID
    },
    {
        "title": "Subtask: Create AI Model for Fitness Suggestions",
        "body": "Develop an AI model to analyze user fitness data and provide personalized workout suggestions.",
        "labels": "AI,Backend",
        "milestone": "Optimizations, AI, and Gamification"
    },
    {
        "title": "Subtask: Create AI Model for Nutrition Suggestions",
        "body": "Develop an AI model to analyze user nutrition data and provide personalized meal suggestions.",
        "labels": "AI,Backend",
        "milestone": "Optimizations, AI, and Gamification"
    },
    {
        "title": "Gamification & Achievements",
        "body": "Implement a gamification system that rewards users with achievements and badges for fitness progress.",
        "labels": "Frontend,Gamification",
        "milestone": "Optimizations, AI, and Gamification"
    },
    {
        "title": "Subtask: Create Achievement System for Fitness Milestones",
        "body": "Set up a system that awards users for reaching specific fitness milestones (e.g., steps, workouts).",
        "labels": "Frontend,Gamification",
        "milestone": "Optimizations, AI, and Gamification"
    },
    {
        "title": "Subtask: Implement User Badges",
        "body": "Allow users to earn and display badges for consistent use and reaching milestones.",
        "labels": "Frontend,Gamification",
        "milestone": "Optimizations, AI, and Gamification"
    },
    {
        "title": "Data Analysis for Trends & Suggestions",
        "body": "Provide users with data-driven suggestions based on trends in their workout and meal habits.",
        "labels": "Backend,Data",
        "milestone": "Optimizations, AI, and Gamification"
    },
    {
        "title": "Subtask: Fitness Data Analysis",
        "body": "Analyze user fitness data over time to generate insights (e.g., workout consistency, calorie burn trends).",
        "labels": "Backend,Data",
        "milestone": "Optimizations, AI, and Gamification"
    },
    {
        "title": "Subtask: Nutrition Data Analysis",
        "body": "Analyze user nutrition data to generate insights (e.g., macro distribution, calorie intake trends).",
        "labels": "Backend,Data",
        "milestone": "Optimizations, AI, and Gamification"
    }
]


# Function to create issues using GitHub CLI
def create_issue(title, body, labels, milestone):
    command = f'gh issue create --title "{title}" --body "{body}" --label "{labels}" --milestone "{milestone}" --project "Corpus Vitae"'
    result = subprocess.run(command, shell=True)
    if result.returncode == 0:
        print(f"Issue '{title}' created successfully.")
    else:
        print(f"Failed to create issue '{title}'.")

# Loop through issues and create them with a 5-second delay
for issue in issues:
    create_issue(issue["title"], issue["body"], issue["labels"], issue["milestone"])
    time.sleep(3) 
