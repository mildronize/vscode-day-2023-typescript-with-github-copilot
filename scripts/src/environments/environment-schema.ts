import { z } from 'zod';

export function preprocessEnv(val: unknown) {
  if (typeof val !== 'string') throw new Error(`Expected string, got ${typeof val}`);
  if (val.toLowerCase() !== 'dev' && val.toLowerCase() !== 'uat')
    throw new Error(`Expected 'dev' or 'uat', got ${val}`);
  return val.toLowerCase();
}

export enum Region {
  SEA = 'sea',
  EASTASIA = 'eastasia',
  AUSEAST = 'auseast',
}

export function preprocessRegion(val: unknown) {
  if (typeof val !== 'string') throw new Error(`Expected string, got ${typeof val}`);
  if(val === 'East Asia') return Region.EASTASIA;
  if(val === 'Australia East') return Region.AUSEAST;
  if(val === 'Southeast Asia') return Region.SEA;
  throw new Error(`Expected 'East Asia' or 'Australia East' or 'Southeast Asia', got ${val}`);
}

export function preprocessBoolean(val: unknown) {
  if(typeof val !== 'string') throw new Error(`Expected string, got ${typeof val}`);
  if(val.toLowerCase() !== 'true' && val.toLowerCase() !== 'false') throw new Error(`Expected 'true' or 'false', got ${val}`);
  if(val.toLowerCase() === 'true') return true;
  return false;
}

export const envSchema = z.object({
  environment: z.preprocess(preprocessEnv, z.union([z.literal('dev'), z.literal('uat')])),
  region: z.preprocess(preprocessRegion, z.nativeEnum(Region)),
  enable_web: z.preprocess(preprocessBoolean, z.boolean()),
  enable_api: z.preprocess(preprocessBoolean, z.boolean()),
  enable_mobile_api: z.preprocess(preprocessBoolean, z.boolean()),
});
