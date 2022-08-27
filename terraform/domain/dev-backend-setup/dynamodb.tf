# Create Dynamodb table for maintaining the state of the State Lock
resource "aws_dynamodb_table" "tf_state_lock_table" {
  name         = "${var.app_name}-${var.env}-tf-state-lock"
  billing_mode = "PAY_PER_REQUEST"
  # read_capacity  = 20
  # write_capacity = 20
  hash_key = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}