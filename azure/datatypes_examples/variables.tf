variable "prefix" {
  default = ["Mr", "Mrs", "sir"]
  type    = list
}
variable "file-content" {
  type = map
  default = {
    "statement1" = "One"
    "statement2" = "Two"

  }

}

variable "bella"{
type=object(
  {
  name=string
  color=string
  age=number
  food=list(string)
  favorite_pet=bool
  })

  default = {
    age = 1
    color = "red"
    favorite_pet = true
    food = [ "fish","chicken" ]
    name = "annan"
  }

}
variable "kitty" {
  type=tuple([string,number,bool])
  default = [
  "cat",1,false]
}

