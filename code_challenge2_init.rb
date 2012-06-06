require "./uncle_sam"

#Input1
A1 = Input.new("1 book at 12.49")
A2 = Input.new("1 music CD at 14.99")
A3 = Input.new("1 chocolate bar at 0.85")

# Input 2:
B1 = Input.new("1 imported box of chocolates at 10.00")
B2 = Input.new("1 imported bottle of perfume at 47.50")

# Input 3:
C1 = Input.new("1 imported bottle of perfume at 27.99")
C2 = Input.new("1 bottle of perfume at 18.99")
C3 = Input.new("1 packet of headache pills at 9.75")
C4 = Input.new("1 box of imported chocolates at 11.25")

S1 = ShoppingCart.new("INPUT 1")
S1.add_items(A1.item)
S1.add_items(A2.item)
S1.add_items(A3.item)
S1.checkout


S2 = ShoppingCart.new("INPUT 2")
S2.add_items(B1.item)
S2.add_items(B2.item)
S2.checkout


S3 = ShoppingCart.new("INPUT 3")
S3.add_items(C1.item)
S3.add_items(C2.item)
S3.add_items(C3.item)
S3.add_items(C4.item)
S3.checkout