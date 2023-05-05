import { envSchema } from './environments/environment-schema';
import * as core from '@actions/core';

interface Matrix {
  environment: string;
  region: string;
  enable_web: string;
  enable_api: string;
  enable_mobile_api: string;
}

async function main() {

  try {
    const mock: Matrix = {
      environment: 'dev',
      region: 'us-east-1',
      enable_web: 'true',
      enable_api: 'true',
      enable_mobile_api: 'true',
    }
    core.setOutput('matrix', [mock]);
  } catch (error: unknown) {
    if(error instanceof Error) {
      core.setFailed(error.message);
    } else {
      core.setFailed(`Unknown error ${error}`);
    }
  }
}

main();
