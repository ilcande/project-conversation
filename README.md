# Project Conversation History

This project implements a basic conversation history system for managing and tracking the status and comments of a project in a Ruby on Rails application.

## Overview

The user can:

- **Leave comments** on a project.
- **Change the status** of a project.

These actions are stored in a conversation history with the status changes and comments displayed for each project.

## Features Implemented

- **User Authentication**: Devise gem used for user authentication.
- **Projects**:
  - A user can create a project.
  - A user can view and update their own projects.
  - Users can only change the status of projects they created.
- **Comments**:
  - A user can add a comment to a project.
  - A user can delete only their own comments.
  - A comment is associated with a user and project.
  
## Current Limitations

- **User Permissions**: Users can only update the status of projects they own, and only their comments can be deleted.
- **Basic UI**: The user interface is simple and functional but not optimized for larger project lists or complex workflows.
- **Error Handling**: Validation errors are shown, but the user experience for error messages could be improved (e.g., inline validation).

## Future Improvements

### Technical Improvements

1. **Pagination**: For projects and comments to handle large datasets efficiently, we could implement pagination on the index and show pages.
2. **Caching**: Implement caching mechanisms (e.g., fragment caching) to improve the performance of displaying projects and comments.
3. **Background Jobs**: For actions like creating or updating projects, background jobs could be used for processing, especially if there are additional complex processes in the future (e.g., notifications).
4. **Role-based Access Control (RBAC)**: Implement roles (e.g., Admin, Manager) to allow users with different roles to edit or delete projects or comments.
5. **Enhanced Search**: Add a search and filter feature for projects to quickly find relevant projects.
6. **Testing**: Add tests to cover edge cases and ensure the application works as expected.

### Product Improvements

1. **Comment Threads**: Implement threaded or nested comments for more complex project discussions.
2. **Real-time Updates**: Implement ActionCable or WebSockets for real-time comment updates, project status changes, and notifications to users.
3. **Rich Text Support**: Allow rich text or markdown formatting for comments, to provide more expressive conversations.
4. **Attachments**: Enable users to attach files (e.g., images, documents) to comments for more comprehensive discussions.
5. **Notifications**: Implement an email or in-app notification system to alert users when their project status changes or when a comment is added to their project.
6. **Project Categories**: Add categories or tags to projects for better organization and filtering.

## Setup Instructions

1. Clone the repository:

   ```bash
    git@github.com:ilcande/project-conversation.git
   ```

2. Install dependencies:

   ```bash
   bundle install
   ```

3. Create and migrate the database:

   ```bash
   rails db:create db:migrate db:seed
   ```

4. Start the Rails server:

   ```bash
   rails s
   ```

5. Open the application in your browser:

   ```bash
   http://localhost:3000
   ```

6. Log in with the default user:
   - Email: `user{user_id}@example.com`
   - Password: `password`

## Conclusion

This project provides the basic functionality to manage project conversations through status changes and comments. As the application grows, several enhancements can be made both technically and from a product perspective to improve the user experience and functionality. By implementing these improvements, the application can become a more robust and feature-rich platform for managing project conversations and collaboration.
