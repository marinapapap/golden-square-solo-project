# {{Golden Square Solo Project}} Multi-Class Planned Design Recipe

## 1. Describe the Problem

Here is a project to test your golden square skills overall:

> As a customer  
> So that I can check if I want to order something  
> I would like to see a list of dishes with prices.
> 
> As a customer  
> So that I can order the meal I want  
> I would like to be able to select some number of several available dishes.
> 
> As a customer  
> So that I can verify that my order is correct  
> I would like to see an itemised receipt with a grand total.

Use the `twilio-ruby` gem to implement this next one. You will need to use
doubles too.

> As a customer  
> So that I am reassured that my order will be delivered on time  
> I would like to receive a text such as "Thank you! Your order was placed and
> will be delivered before 18:52" after I have ordered.

Fair warning: if you push your Twilio API Key to a public Github repository,
anyone will be able to see and use it. What are the security implications of
that? How will you keep that information out of your repository?

## 2. Design the Class System

_Consider diagramming out the classes and their relationships. Take care to
focus on the details you see as important, not everything. The diagram below
uses asciiflow.com but you could also use excalidraw.com, draw.io, or miro.com_

```
 ┌─────────────────────┐
 │ DishList            │
 ├────────────         │
 │- add(dish)          │
 │                     │
 │- menu               │
 │                     │
 │- selection          │
 │                     │    ┌────────────────┐
 │- receipt(selection) │    │ConfirmOrder    │
 │                     │    ├──────────────  │
 └─────────────────────┘    │                │
             ▲              │ - dependency   │
             │              │   injector     │
   ┌─────────┴────────┐     │                │
   │ Dish(dish, price)│     │ - API request  │
   ├──────────────────┤     │                │
   │- dish            │     │ - confirmation │
   │                  │     │   message      │
   │- price           │     │                │
   │                  │     └────────────────┘
   │- format_dish     │
   │  =>"dish, £price"│
   │                  │
   │- select          │
   │                  │
   │- deselect        │
   │                  │
   │- is_selected?    │
   └──────────────────┘

```

_Also design the interface of each class in more detail._

```ruby
class DishList
  def initialize
    # ...
  end

  def add(dish_with_price) # dish_with_price is an instance of Dish
    # Dish gets added to the menu
    # Returns nothing
  end

  def list
    # Returns list of dishes
  end
  
  def selection
    # returns selected dishes
  end

  def receipt(selection)
  # takes selection and returns itemised receipt with grand total
  end
end

class Dish
  def initialize(dish, price) # dish is a string and price is float
  end

  def dish # returns dish as string
  end

  def price # returns price as float
  end

  def format
    # Returns a string of the form "dish, £price"
  end

  def select
    # formats dish for selection
  end

  def deselect
    # reverse formatting, deselects dish
  end

  def is_selected?
    # returns true if dish has been selected
  end
end

class ConfirmOrder
  def intialize(requester)
    # dependency injector for testing API usage
  end

  def confirmation_message
    # send confirmation message to customer confirming order with time estimate
  end

  def request_to_API
    # make request to API to send message to customer
  end
end

```

## 3. Create Examples as Integration Tests

_Create examples of the classes being used together in different situations and
combinations that reflect the ways in which the system will be used._

```ruby
# EXAMPLE

# Gets all dishes
menu = DishList.new
dish_1 = Dish.new("Pizza", 12.00)
dish_2 = Dish.new("Pasta", 11.00)
menu.add(dish_1)
menu.add(dish_2)
menu.list => [dish_1, dish_2]

# 
menu = DishList.new
dish_1 = Dish.new("Pizza", 12.00)
dish_2 = Dish.new("Pasta", 11.00)
dish_3 = Dish.new("Cake", 7.00)
menu.add(dish_1)
menu.add(dish_2)
dish_1.select
dish_2.select
menu.selection => [dish_1, dish_2]

menu = DishList.new
dish_1 = Dish.new("Pizza", 12.00)
dish_2 = Dish.new("Pasta", 11.00)
dish_3 = Dish.new("Cake", 7.00)
menu.add(dish_1)
menu.add(dish_2)
dish_1.select
dish_2.select
menu.selection => [dish_1, dish_2]
```

## 4. Create Examples as Unit Tests

_Create examples, where appropriate, of the behaviour of each relevant class at
a more granular level of detail._

```ruby
# EXAMPLE

# Constructs a track
track = Track.new("Carte Blanche", "Veracocha")
track.title # => "Carte Blanche"
```

_Encode each example as a test. You can add to the above list as you go._

## 5. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green,
refactor to implement the behaviour._

