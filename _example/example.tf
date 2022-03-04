provider "aws" {
  region = "eu-west-1"
}

module "lightsail" {
  source = "./../"
  name              = "mahesh-test"
  availability_zone = "eu-west-1a"
  blueprint_id      = "ubuntu_20_04"
  bundle_id         = "nano_2_0"
  enabled           = true
  ip_enabled = true
  key_pair_name     = "mahesh-lightsail-key"
  public_key        = "ssh-rsa AAAAB3NzaDLbkgVCxhs3oI0Cz/0AEjAQ+/wZryh/C9mcDEMraRO/HYCSR4CkALDklRUL0bejf8Jfdi58Poakox55bBfoAIA/9AR8F6mK7iyLigyTT1VJGBqqaczCJAcW1Cd2dcIGAxyNaxl8FhAMIh69MRYKZqVi1SC73RTd3v4YZW2F6OGz6WlPnQrL2E0iLmybiH1qJH9zt3VIYOxhlw8xB2EwHNGqxFU9amTBsN+jhUHHvcdLGqMQ3sGxfvLymaesX/a/MR+Au7c6MFCQ1T1mxkBFfDgsRQNLvKW3o8U8T2tGJ15G24SvTvVwAKJSu0WkwwIAW+KF8RvJj1n1P1Rj+VXQSo4V0O2omd33OlzZmAucGKQF1l48uya9Im9n5Zmqk6UxhESBIP6G8GI/FduGpPwOm/xjxalmBilZ1RnIf96QwMnoRbZsS6rE1371FqFJwh6A/TEX+m0wHsGu/Sg1V8jVEe64AEGGUy9maWPMpMB9PqnnzIs4X9ndmuKkTqZbhUMV7M= mahesh@mahesh"
  tags = {
    name = "mahesh-lightsail-tag"
  }
  port_info = [
    {
      port = 80
      protocol = "tcp"
      cidrs = ["0.0.0.0/0"]
    },
    {
      port = 22
      protocol = "tcp"
      cidrs = ["103.15.255.118/32"]
    }
  ]
}
