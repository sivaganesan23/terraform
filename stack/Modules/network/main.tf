resource "local_file" "network" {
  content  = "PROJNAME = ${var.proj}"
  filename = "/tmp/db.txt"
}

