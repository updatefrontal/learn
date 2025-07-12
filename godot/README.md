# Godot

A game is a **tree** of **nodes** grouped into **scenes**, communicating using **signals**.

- **Scene**: A reusable collection of nodes (like a blueprint), e.g., a character or level.
- **Node**: A single object with a function (like Sprite, Camera, etc.).
- **Scene Tree**: The hierarchy of all active scenes and nodes during gameplay.
- **Node Tree**: The parent-child structure of nodes inside a single scene.
- **Signal**: Godot's implementation of the [observer pattern](https://www.youtube.com/watch?v=NY_fzd8g5MU)

---

## Nodes

**Attributes**
- Name
- Editable properties
- Receive callbacks to update every frame
- Extendable with new properties/functions
- Can be parent/child of another node

---

## Scenes

**Attributes**
- A tree of nodes
- Functions like a node
- They have a root node
- Can be saved/loaded to storage
- Multiple instances of a scene can exist (e.g., multiple characters)

---

### First Scene (`learn/godot/godot-docs-project`)

1. Press **[+] (Add Child Node)** (top-left) → choose `Label` → Create
2. Because `Label` is a 2D node, Godot switches to 2D workspace
3. In the **Inspector** (right side), change `Text` to `"Hello World"`
4. Use **Move Mode** (`W`) to reposition
5. Run current scene: **F6** (top-right)
   - `res://` directory is the project's root
   - Close the window: **F6** or **F5**
6. Run the main project scene: **F5**
   - Choose your main scene (once)
   - The main scene path is stored in `project.godot`
     - You can set it through **Project → Project Settings** or edit the file directly

---

### Creating Instances (`learn/godot/instancing_starter`)

Godot scenes are saved as `.tscn` files (text scenes)

- A saved scene can be **instanced** many times
- Each instance has a unique name
- The node structure is hidden by default in the scene tree
- All instances start identical to the base, but exposed properties can be modified

**To Instance a Scene:**
- Use **Ctrl + Shift + A** → search for scene to instance
- Duplicate instance: **Ctrl + D**
- Edit every instance by editing the `.tscn` scene file
  - Go to **FileSystem (bottom-left)** → double-click `Ball.tscn`
- Modify individual instances:
  - Select an instance in the scene
  - Use **Inspector** (right side) to override default properties
  - Changed values will show a revert arrow (⟳)
- **Note**: Some properties like `Physics Material` are **resources**:
  - Right-click the property → **Make Unique** to edit

---

### Scripting Languages



