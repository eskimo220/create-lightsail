# インスタンスを作成(vps01)
resource "aws_lightsail_instance" "vps01" {
  name              = "vps01"
  availability_zone = "ap-northeast-1a"
  blueprint_id      = "amazon_linux_2"
  bundle_id         = "nano_2_0"
  key_pair_name     = "kaifa"
}

# 静的グローバルIPアドレスを割り当てる
resource "aws_lightsail_static_ip" "vps01_static_ip" {
  name = "vps01_static_ip"
}

# vps01インスタンスへ静的グローバルIPアドレスをアタッチする
resource "aws_lightsail_static_ip_attachment" "zeus_attach" {
  static_ip_name = aws_lightsail_static_ip.vps01_static_ip.id
  instance_name  = aws_lightsail_instance.vps01.id
}

# vps01インスタンスへ適用するファイアウォールルールを定義
resource "aws_lightsail_instance_public_ports" "vps01_fw" {
  instance_name = aws_lightsail_instance.vps01.name

  # SSH接続を XXX.XXX.XXX.XXX/32 からのみ許可
  port_info {
    protocol  = "tcp"
    from_port = 22
    to_port   = 22
    # cidrs = ["XXX.XXX.XXX.XXX/32"]
  }

  # HTTPアクセスを全て許可
  port_info {
    protocol  = "tcp"
    from_port = 80
    to_port   = 80
  }

  # HTTPSアクセスを全て許可
  port_info {
    protocol  = "tcp"
    from_port = 443
    to_port   = 443
  }
}