import { envSchema } from './environments/environment-schema';
import * as core from '@actions/core';
import { FlattenAzureResource } from './types';

interface Matrix {
  environment: string;
  region: string;
  enable_web: boolean;
  enable_api: boolean;
  enable_mobile_api: boolean;
}

async function main() {

  try {
    const azureResources: FlattenAzureResource[] = [{
      env_name: 'dev',
      name: 'thadawvscode2023-dev-sea-web',
      resource_group: 'rg-vscode2023-dev-sea',
      subscription: 'Thada Public Talk',
    }]; 
    core.setOutput('matrix', azureResources);
  } catch (error: unknown) {
    if(error instanceof Error) {
      core.setFailed(error.message);
    } else {
      core.setFailed(`Unknown error ${error}`);
    }
  }
}

main();
