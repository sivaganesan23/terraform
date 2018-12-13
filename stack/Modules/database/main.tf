resource "local_file" "database" {
  content  = "database"
  filename = "/tmp/db.txt"
}
