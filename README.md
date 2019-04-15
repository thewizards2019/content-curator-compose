# content-curator-compose
https://docs.confluent.io/current/installation/installing_cp/zip-tar.html


https://trello.com/b/zrqAxGgd/datacurator

kkeenan [8:29 PM]
I was 1/5th of The Wizards and Wizadora. Even though we didn’t feature in the winning line-up, but we had a great time, and in case anyone is interested, we think our idea is pretty neat, so why not share it too:

Bringing online content curation into the hands of the user:

All too often large social media platforms have too much control over what we see online. Much of their content curation is based on user engagement, but fighting online harassment is an increasingly high priority. This task is tough when users are required to manually report, and platforms are required to manually remediate. Worse again is the byproduct of these platforms applying broad policies through an abundance of caution that results in in-authentic experiences for users, drinking them elsewhere. As well as this, on these platforms users are increasingly being mined for identifying data that exposes the entire fabric of our society to an untenable vulnerability; namely the gamification of our democracy.

To combat this we designed and built a platform that allows a users to subscribe to any of their social media feeds, and using a modular plug and play model coupled with Apache Kafka, control what and how that content is exposed to them in real-time in a UI that we also built. We built three “tagging” modules for our demo; a profanity detection service, a sentiment service, and a personal preference binary classifier (logistic regression) service. The coolest feature was the user’s ability to interact with their own personal binary classification training set through the UI, being able to add, remove and retag their own content to retrain their model on demand. This feature, in contrast to the black box global models used on social media platforms, brings ML to the forefront of the users experience on our service, bridging the growing gap between users of technology, and their ability to understand the technology itself. As part of our demo, we were able to show how a user could mask low sentiment content (if they had a bad day and only wanted positivity), profanity, and material that just didn’t fit their preference (is anyone sick of brexit yet?). In summary, over the course of the weekend, our team built the following, which almost seems crazy looking back:

1. Ingestion-service (python Kafka producer)
2. Profanity-tagging-service (python Kafka producer/consumer)
3. Sentiment-tagging-service (python Kafka producer/consumer)
4. Preference-tagging-service (python Kafka producer/consumer)
5. Binary classification api (python flask: with a retrain endpoint to retrain at any time)
6. Kafka streams event processor for aggregating state from the event-sourced tags (scala)
7. Api to expose state to the UI, as well as the training data to the binary classification api (scalatra)
8. UI with masked content feed + preference tagging + settings to show mask content (angular)
9. Preference tagging api (python flask + Kafka producer; allowed the UI to post a user defined tag on to the event stream in Kafka)
10. As a bonus, to demo the flexibility and extensibility of our architecture, be we’re also about to build a speech to text input service that seamlessly integrated to our existing platform to display in the UI as masked content depending on the users preferences.

Myself and the team had a great time, and we’d like to thank the organisers for all their effort. Cheers


START ORDER:
$./start_confluent.sh
$./start_ingest-twitter.sh
$./start_datacurator-sentiment.sh
$./start_datacurator-profanity.sh
$./start_datacurator-stream-aggregator.sh
$./start_datacurator-preference-tagger.sh
$./start_datacurator-stater.sh
$./start_content-curator-ui.sh
