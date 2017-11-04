resource "aws_sns_topic" "javahome_app_queue" {
  name = "javahome-topic"
  display_name = "JavaHome"
}

# resource "aws_sns_topic_subscription" "user_updates_sqs_target" {
#   topic_arn = "${aws_sns_topic.javahome_app_queue.id}"
#   protocol  = "email"
#   endpoint  = "hari.kammana@gmail.com"
# }
