#!/bin/bash
cd /home/ec2-user/.driftctl
# LOG_LEVEL=debug  

# driftctl scan  --disable-telemetry --deep --from tfstate+s3://3m-his-{{ SubEnv }}-bcknd/terraform.tfstate --from tfstate+s3://3m-his-{{ SubEnv }}-bstn-bcknd/terraform.tfstate  --filter "Attr.tags_all.ApplicationID=='229'"  --tf-provider-version=4.15.0 --output console:// --output html://driftctl_{{ account_env }}.html  > driftctl_{{ account_env }}_plain_text || cat driftctl_{{ account_env }}_plain_text  |  mail -s "drifts detected in {{ account_env }}" -a /home/ec2-user/.driftctl/driftctl_{{ account_env }}.html US-MM-CAPD-DevOps@mmm.com

driftctl scan --disable-telemetry --deep --from tfstate+s3://3m-his-{{ SubEnv }}-bcknd/terraform.tfstate  --from tfstate+s3://3m-his-{{ SubEnv }}-bstn-bcknd/terraform.tfstate --filter "Attr.tags.ApplicationID=='229' && Attr.tags.mmodal_env=='{{ account_env }}' && Attr.tags.ResourceCreator!='mmoore5@mmm.com' && Attr.tags.ResourceCreator!='bcgardner@mmm.com'"  --tf-provider-version=4.15.0 --output console:// --output html://driftctl_{{ account_env }}.html  > driftctl_{{ account_env }}_plain_text || cat driftctl_{{ account_env }}_plain_text  |  mail -s "drifts detected in {{ account_env }}" -a /home/ec2-user/.driftctl/driftctl_{{ account_env }}.html US-MM-CAPD-DevOps@mmm.com 

# driftctl scan --deep --from tfstate+s3://3m-his-{{ SubEnv }}-bcknd/terraform.tfstate  --filter "Attr.tags.ApplicationID=='229' && Attr.tags.mmodal_env=='{{ account_env }}' && Attr.tags.ResourceCreator!='mmoore5@mmm.com' && Attr.tags.ResourceCreator!='bcgardner@mmm.com'"  --tf-provider-version=4.15.0 --output console:// --output html://driftctl_{{ account_env }}.html  > driftctl_{{ account_env }}_plain_text || cat driftctl_{{ account_env }}_plain_text  |  mail -s "drifts detected in {{ account_env }}" -a /home/ec2-user/.driftctl/driftctl_{{ account_env }}.html US-MM-CAPD-DevOps@mmm.com 

# US-MM-CAPD-DevOps@mmm.com 

# if there is an output move it over.
#
# run the driftctl command
#
# email the output to devops. Store it in the folder too
# body of email is determind by the output of the command
#
