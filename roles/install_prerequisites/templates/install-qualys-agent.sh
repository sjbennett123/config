# ______________________________________________________________________________________

# File          | install-qualys-agent.sh

# Author        | Sevy Cushing

# Last Updated  | 08/19/2021

# --------------------------------------------------------------------------------------

# Documentation | https://www.qualys.com/docs/qualys-cloud-agent-linux-install-guide.pdf

# ______________________________________________________________________________________



# NOTE:

# This script will only cover Qualys agent install for the following regions:

#  - us-east-1

#  - eu-central-1

#  - ap-southeast-2

#  - ca-central-1

#  - eu-west-2





#!/bin/bash

# set -x

#sudo yum -y update



INSTANCEID="$(curl -s http://instance-data/latest/meta-data/instance-id/)"

REGION="$(curl -s http://instance-data/latest/meta-data/placement/availability-zone | sed 's/.$//')"

ACTIVATIONID="-"



if [ $REGION == "us-east-1" ];

then

    ACTIVATIONID="64a2044d-8289-4e57-bb37-54c90c124f1c";

elif [ $REGION == "eu-central-1" ];

then

    ACTIVATIONID="b199736b-1b73-4195-85b5-204fa911f8c4";

elif [ $REGION == "ap-southeast-2" ];

then

    ACTIVATIONID="df6828b1-21ba-419e-8217-3096c92388d6";

elif [ $REGION == "ca-central-1" ];

then

    ACTIVATIONID="5d389ee8-75cb-43db-b459-e1b68e0cc752";

elif [ $REGION == "eu-west-2" ];

then

    ACTIVATIONID="d7359222-0468-48e3-891b-706c3a65f6b8";

else

    echo "ERROR: Qualys activation key does not exist for this region. Script has failed."

    exit

fi





wget  https://artifactory-pit.mmodal-npd.com/artifactory/internal-yum-pit/QualysCloudAgent.rpm

sudo rpm -ivh QualysCloudAgent.rpm

sudo  /usr/local/qualys/cloud-agent/bin/qualys-cloud-agent.sh ActivationId=$ACTIVATIONID CustomerId=6ee5d733-9e25-7597-8254-c36cfcfb4bed



rm -rf QualysCloudAgent.rpm
