data "template_file" "calico" {
  template = "${file("${path.module}/resources/manifests/kube-calico.yaml")}"

  vars {
    calico_cni_image = "${var.container_images["calico_cni"]}"
    calico_image     = "${var.container_images["calico"]}"
    cluster_cidr     = "${var.cluster_cidr}"
    mtu              = "${var.mtu}"
    tigera_pull_secret = "${base64encode(file(var.tigera_pull_secret_path))}"
  }
}

resource "local_file" "calico" {
  count = "${var.enabled ? 1 : 0}"

  content  = "${data.template_file.calico.rendered}"
  filename = "./generated/net-manifests/kube-calico.yaml"
}
