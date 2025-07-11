# GDScript

## Function Definitions & Calls
```gdscript
# Define a function
func func_name(parameters):
    instruction1
    instruction2

# Call a function
func_name(arguments)
```

## Variables
```gdscript
# Define and assign a variable
var var_name = 100

# Type hint
var cell: Vector2 = Vector2(50.0, 50.0)

# Type inference (Godot 4+)
var cell := Vector2(50.0, 50.0)

# Accessing sub-values
position.x
```

## Built-in Functions
```gdscript
# Called every frame; delta is time since last frame in seconds
func _process(delta):
    rotate(3.0 * delta)
```

## Printing
```gdscript
print(value)
```

## Vectors
```gdscript
# Create a Vector2
var v = Vector2(1, 2)

# Modify with vector math
scale += Vector2(0.2, 0.2)
```

## Loops & Ranges
```gdscript
# For loop with range (range is exclusive of end)
for i in range(10):
    print(i)  # 0 to 9

# While loop
while condition:
    do_something()
```

## Arrays
```gdscript
# Define an array
var my_array = [1, 2, 3]

# Methods
my_array.append(4)
my_array.pop_front()
my_array.pop_back()
print(my_array.size())

# Access elements
print(my_array[0])     # First element
print(my_array[-1])    # Last element (negative indexing)
```

## Dictionaries
```gdscript
# Define a dictionary
var my_dict = {
    "hp": 100,
    "mp": 50
}

# Access value by key
print(my_dict["hp"])

# Safer access with default value
print(my_dict.get("stamina", 0))

# Loop through keys
for key in my_dict:
    print(key, my_dict[key])
```

## Types & Conversion
```gdscript
# Common types
var n: int = 42
var name: String = "Hero"

# Type conversion
str(123)      # → "123"
int("10")     # → 10
float("3.14") # → 3.14

# Integer division returns int
var result = 5 / 2  # 2 (if both are int)
```

## Strings
```gdscript
var msg = "this is a string"
print(msg.length())
```

## Links
[Godot Docs](https://docs.godotengine.org/en/stable/)  
[Learn GDScript from Zero](https://gdquest.github.io/learn-gdscript/?ref=godot-docs)  
[GDScript Cheat Sheet](https://school.gdquest.com/cheatsheets/gdscript)
