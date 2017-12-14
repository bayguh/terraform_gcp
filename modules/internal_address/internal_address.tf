variable "internal_address_variables" {
  type = "map"
  description = "internal_address変数"
  default = {
    name       = ""
    subnetwork = ""
  }
}

/**
 * INTERNAL アドレス作成
 * https://www.terraform.io/docs/providers/google/r/compute_address.html
 */
resource "google_compute_address" "internal_address" {
  name         = "${var.internal_address_variables["name"]}"
  address_type = "INTERNAL"
  subnetwork   = "${var.internal_address_variables["subnetwork"]}"
}

output "internal_address" {
    value = "${google_compute_internal_address.internal_address.address}"
}
