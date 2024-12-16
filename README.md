**Contacts for Support**
- @rupertlssmith on https://elmlang.slack.com
- @rupert on https://discourse.elm-lang.org

# elm-aws-messaging

This is a set of client side stubs for using the AWS messaging services. This currently consists of Sqs 
and EventBridge, and will eventually include Sns.

These AWS messaging related services are all separate AWS services and not in any way integrated together.
They have been bundled into this Elm package as a group of related functionality. Note that Elm has excellent
source tree pruning, so only the modules that you include in a project will end up in the build artifact, so
bundling several services together does not come with an artifact size penalty.