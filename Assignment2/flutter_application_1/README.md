Q1. Create a small To-Do List screen in Flutter where users can add
tasks and mark them as completed.
1. AppBar title: My Todos
2. Add Task - TextField to enter task and Add button next to it
When the user types text and presses Add:
· If the text is not empty, add it to the todo list and Clear the
TextField after adding
· If the text is empty, do nothing

Q2. Create a Flutter app with two screens: Login and Welcome.
Screen 1: Login
· Use a TextFormField for Email and Password
· Add a Checkbox labeled “Remember me”
· Add a large indigo backroundcolor “Login” button
· If both email and password are not empty → navigate to Welcome
screen
· If any field is empty → show SnackBar “Fill both fields”
Screen 2: Welcome
· AppBar title: “Welcome”
· Display big text: “Hello, User!”

Q3. Develop a Flutter application screen that displays a list of items
using ListView. The screen must include a Floating Action Button which,
when pressed, dynamically adds a new item to the list and updates the
UI immediately.
1. Display a list of items on the screen.
2. Use ListView or ListView.builder to show the list.
3. Add a FloatingActionButton at the bottom-right corner.
4. On clicking the FAB: A new item should be added to the list.

Q4. Design a Flutter Login Screen with proper validation and
background design.
· Email input using TextFormField - Field is required and mail must be
in valid format
· Password input using TextFormField - Minimum 8 characters
· Add show/hide password option
· Submit button

Q5. Create a Flutter app with two screens to add books and view the
book list.
Screen 1: Add Book
· TextField for Book Title and Author Name
· Add Book button - On button presses -> If both fields are not empty → add book to list and go to View screen
Screen 2: View Books
· AppBar title: “My Books”
· Display books using ListView
· Each row shows: Book Title, Author Name

Q6. Design a Product Catalog screen using GridView.
· Display products in a 2-column GridView
· Each product card must show: Product image, Product name and Price
· Store product data using a List<Map>

Q7. Display employees in a grid layout.
Each grid item shows:
· Circular profile image
· Employee name
· Department
On tap: Show employee Name in a SnackBar