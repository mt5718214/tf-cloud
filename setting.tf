# 這邊的設定與terraform cloud上的organization與workspaces相同
terraform {
  backend "remote" {
    organization = "test_organ_by_kemp"
    workspaces {
      name = "tf-cloud"
    }
  }
}