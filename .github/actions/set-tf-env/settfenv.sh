#!/bin/bash

# Set up the Azure Provider Environment Variables
tempvar=$ARM_CLIENT_ID
echo "ARM_CLIENT_ID=$tempvar" >> $GITHUB_ENV
tempvar=$ARM_SUBSCRIPTION_ID
echo "ARM_SUBSCRIPTION_ID=$tempvar" >> $GITHUB_ENV
tempvar=$ARM_TENANT_ID
echo "ARM_TENANT_ID=$tempvar" >> $GITHUB_ENV

# Set up the Terraform backend vars
tempvar=$TF_SUBSCRIPTION_ID
if [ -z "$tempvar" ]; then
  tempvar=$ARM_SUBSCRIPTION_ID
fi
echo "TF_SUBSCRIPTION_ID=$tempvar" >> $GITHUB_ENV

tempvar=$TF_STATE_RESOURCE_GROUP
echo "TF_STATE_RESOURCE_GROUP=$tempvar" >> $GITHUB_ENV
tempvar=$TF_STATE_BLOB_ACCOUNT
echo "TF_STATE_BLOB_ACCOUNT=$tempvar" >> $GITHUB_ENV

tempvar=$TF_STATE_BLOB_CONTAINER
if [ -z "$tempvar" ]; then
  tempvar='tfstate'
fi
echo "TF_STATE_BLOB_CONTAINER=$tempvar" >> $GITHUB_ENV

tempvar=$TF_VAR_FILE
if [ -z "$tempvar" ]; then
  tempvar="$ENVIRONMENT_NAME.tfvars"
fi
echo "TF_VAR_FILE=$tempvar" >> $GITHUB_ENV

tempvar=$TF_BLOB_FILE
if [ -z "$tempvar" ]; then
  tempvar='terraform.tfstate'
fi
echo "TF_BLOB_FILE=$tempvar" >> $GITHUB_ENV
