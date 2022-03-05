provider "aws" {
  region = "ap-south-1"
}

module "lightsail" {
  source               = "./../"
  instance_enabled     = true
  name                 = "mahesh-lightsail"
  environment          = "test"
  label_order          = ["name", "environment"]
  key_pair_name  = "mahesh-keypair"
  public_key  = "ssh-rsa AAAAB3NzaC1ycwZryh/C9mcDEMGxfvLymaesX/a/MR+Au7c6MFCQ1T1mxkBFfDgsRQNLvKW3o8U8T2tGJ15G24SvTvVwAKJSu0WkwwIAW+KF8RvJj1n1P1Rj+VXQSo4V0O2omd33OlzZmAucGKQF1l48uya9Im9n5Zmqk6UxhESBIP6G8GI/FduGpPwOm/xjxalmBilZ1RnIf96QwMnoRbZsS6rE1371FqFJwh6A/TEX+m0wHsGu/Sg1V8jVEe64AEGGUy9maWPMpMB9PqnnzIs4X9ndmuKkTqZbhUMV7M= mahesh@mahesh"
  use_default_key_pair = false
  port_info            = [
    {
      port     = 80
      protocol = "tcp"
      cidrs    = ["0.0.0.0/0"]
    },
    {
      port     = 22
      protocol = "tcp"
      cidrs    = ["103.15.255.118/32"]
    }
  ]


  tags = merge({ Name = "mahesh", module = "lightsail" })

}
