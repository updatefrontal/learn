# Godot

A game is a **tree** of **nodes** grouped into **scenes**, communicating using **signals**.

- **Scene**: A reusable collection of nodes (like a blueprint), e.g., a character or level.
- **Node**: A single object with a function (like Sprite, Camera, etc.).
- **Scene Tree**: The hierarchy of all active scenes and nodes during gameplay.
- **Node Tree**: The parent-child structure of nodes inside a single scene.
- **Signal**: Godot's implementation of the [observer pattern](https://www.youtube.com/watch?v=NY_fzd8g5MU)
 

## Nodes

**Attributes**
- Name
- Editable properties
- Receive callbacks to update every frame
- Extendable with new properties/functions
- Can be parent/child of another node


## Scenes

**Attributes**
- A tree of nodes
- Functions like a node
- They have a root node
- Can be saved/loaded to storage
- Multiple instances of a scene can exist (e.g., multiple characters)

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

# First 2D Game

## Player

```gdscript
@export var speed = 400
```

- Exporting allows the `speed` variable to be set in the **Inspector**

```gdscript
func _ready():
    # Called when the scene is instantiated
    pass

func _process(delta: float):
    # Called every frame for this instance
    pass
```


### Input

- Input actions: `Project > Project Settings > Input Map`
  - Add new actions or edit existing ones
  - Use the **+** to assign key presses

```gdscript
if Input.is_action_pressed("move_right"):
    position.x += speed * delta
```

- [`Vector Math` docs](https://docs.godotengine.org/en/stable/tutorials/math/vector_math.html#doc-vector-math)


### Node Access

- `$` is shorthand for `get_node()`

```gdscript
$AnimatedSprite2D.play()
# Equivalent to:
get_node("AnimatedSprite2D").play()
```

- Returns `null` if no node is found


### Utility Functions

```gdscript
clamp(value, min, max)
# Restricts value within the given range
```


### Choosing Animations

- `flip_h`: Flip horizontally  
- `flip_v`: Flip vertically


### Collisions

- Use **signals** to respond to collisions (e.g. when hit)
- In the **Node** tab (top-right), see available signals for the selected node

```gdscript
# Example: disabling after a hit
set_deferred("disabled", true)
# Ensures the property is set only when safe (avoids mid-calculation bugs)
```

## Enemy

Scene-> New Scene
VisibleOnScreenNotifier2D: Adds a signal for leacing/entering screen
queue_free(): deletes the instance at the end of frame


## Main Scene

### HUD

- **CanvasLayer**:  
  Used to draw UI elements on a layer above the rest of the scene.

- **Control Nodes**:  
  Base class for all UI elements.

  - `Label`  
    - Displays text  
    - Can use custom fonts

  - `Button`  
    - Clickable UI element

- **Control Node Properties**:  
  - `position`: screen location  
  - `size`: width and height  
  - `anchor`: origin point (e.g., top-center in the Godot UI)

#### Await

```gdscript
await X
```

- Pauses execution of the function until `X` completes

```gdscript
await get_tree().create_timer(1.0).timeout
```

- Creates a temporary, **non-blocking** timer  
- GDScript does **not** support `sleep()` — use this for delays


#### Connecting Signals

- You can **pick an existing function** in the editor when connecting a signal.


#### Groups

- Node → **Groups** tab (next to Signals in top-right of editor)
- Use to **tag all instances** of a scene or similar nodes

```gdscript
get_tree().call_group("group_name", "method_name", arg1, arg2)
```

- Calls `method_name` on **every node** in `"group_name"` with optional arguments


### Finishing Up

#### Background

- **ColorRect Node**  
  - Used to set a solid background color

- **TextureRect Node**  
  - Used to set a background image

- **Node Order**  
  - Nodes listed first in the scene tree are drawn **behind** later ones

#### Sound

- **AudioStreamPlayer Node**  
  - Used to play sound effects or music

  - By default, **looping is disabled**  
    - Click the sound file in the FileSystem and enable "Loop"

  - Use the `play()` method in script to trigger the sound

```gdscript
$AudioStreamPlayer.play()
```

#### Unique Scenes & Resources

- **Make Unique**  
  - Use when you want a scene or resource instance to diverge from the original  
  - Changes won't affect other instances of the original scene or resource

#### Keyboard Shortcuts

1. Go to **Project > Project Settings > Input Map**
2. Add a new action name
3. Click **+** to assign a key

#### Assign Shortcut to a Button Node

1. Select the `Button` node
2. In the **Inspector**, find the `Shortcut` property
3. Click `New Shortcut`
4. Click the created Shortcut again to edit the **input event array**

# Links

- [Vector Math (Godot Docs)](https://docs.godotengine.org/en/stable/tutorials/math/vector_math.html#doc-vector-math)
