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

### Scripts (`learn/godot/gdot-docs-project`)

1. Add a `Sprite2D` node
2. In **FileSystem** (bottom-left), drag a texture (e.g. `icon.svg`) into the Sprite's **Texture** property
3. Right-click the node → **Attach Script**
   - This creates a `.gd` file (GDScript)

**Notes:**
- Every `.gd` script is implicitly a **class**
  - It inherits all properties and methods from the class it extends
- **Inspector** shows properties in **Title Case**
  - Hover over a property to see its `snake_case` version for use in code

```gdscript
# Example:
extends Sprite2D

# Constructor - called when an object is created
func _init():
    pass
```

- **Member Variables**:
  - Exist as long as the object exists
  - Store state/data
  - Declared between `extends` and `func` blocks

```gdscript
var speed = 200
```

- `_process(delta)`:
  - Special function called **every frame**
  - Use it for updates like movement or animation

```gdscript
func _process(delta):
    position.x += speed * delta
```

- **Ctrl + Click** any property/function to open its documentation

---

### Listening to Player Input (`learn/godot/gdot-docs-project`)

2 ways:

- `_unhandled_input(event)`:
  - Virtual function that is called every time a key is pressed  
  - Use to react to discrete input events  

```gdscript
func _unhandled_input(event):
    if event.is_action_pressed("ui_accept"):
        print("Accepted!")
```

- `Input` object:
  - Use to check for input **every frame**

```gdscript
func _process(delta):
    if Input.is_action_pressed("ui_left"):
        position.x -= speed * delta
```

- `Input` was used because we need to know if the player wants to turn **every frame**  
- `_process()` is used to **apply changes** to the node every frame  
- `Sprite2D` attributes like `position` and `rotation` are used to move the node  

---

### Using Signals (`learn/godot/gdot-docs-project`)

**Signal**: Messages that nodes emit when a specific event happens.  
Other nodes can connect to that signal and call a function when the event occurs.

#### Connecting Signals in the Editor

**Steps:**

1. Open the **Node** tab (top-right)
2. Double-click the signal you want to connect (e.g. `pressed()`)
3. Select:
   - **Listeners** (nodes that will receive the signal)
   - **Receiver method** (callback function to call)

- **Simple mode**: Select nodes with scripts and Godot auto-generates the callback function
- **Advanced mode**: Choose any node, method, add arguments, and set options

Once connected, a **callback function** is added to the listener’s script, marked with a **green arrow** in the editor.

**Callback Naming Convention:**

```gdscript
func _on_<node_name>_<signal_name>():
    # Example:
    func _on_timer_timeout():
        print("Timer finished!")
```

#### Connecting Signals via Code

Use this approach when creating or instantiating nodes in a script.

**Steps:**

1. Get a reference to the node emitting the signal  
2. Use `.connect()` to bind the signal to a function

```gdscript
var timer = get_node("Timer")
timer.connect("timeout", self, "_on_timer_timeout")
```

- This will call `_on_timer_timeout()` whenever the `timeout` signal is emitted by `timer`

#### Custom Signals

You can define your own signals at the top of a script using the `signal` keyword.

```gdscript
signal health_depleted

func take_damage(amount):
    health -= amount
    if health <= 0:
        health_depleted.emit()
```

Custom signals can also have arguments:

```gdscript
signal health_changed(old_value, new_value)

func take_damage(amount):
    var old_health = health
    health -= amount
    health_changed.emit(old_health, health)
```