# Publish packages
```
sui client publish --gas-budget 100000000
```
# Create object from package
```
sui client call --package 0x8816b76dc3b05e14cab703c896ac116b9ceb0332c19c41b8b4d2bda1dc9c7f5d --module counter --function create --gas-budget 10000000
```
# Check package ID
```
sui client object <OBJECT_ID>
```
# Increment counter
```
sui client call --package 0x8816b76dc3b05e14cab703c896ac116b9ceb0332c19c41b8b4d2bda1dc9c7f5d --module counter --function increment --args 0x706f3643d187a61546c04a174b48c57d6d24faae6ab80ec393a3cd0b7b183d56 --gas-budget 10000000
```
# Set value
```
sui client call --package 0x8816b76dc3b05e14cab703c896ac116b9ceb0332c19c41b8b4d2bda1dc9c7f5d --module counter --function reset --args 0xf10a8595cb2f94424d92053b5f1084aa02301d8ff6be1c2a981a2138b27e02f3 0x706f3643d187a61546c04a174b48c57d6d24faae6ab80ec393a3cd0b7b183d56 --gas-budget 10000000
```