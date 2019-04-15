curl -O http://packages.confluent.io/archive/5.2/confluent-5.2.1-2.12.zip
unzip confluent-5.2.1-2.12.zip
./confluent-5.2.1/bin/confluent destroy
./confluent-5.2.1/bin/confluent start