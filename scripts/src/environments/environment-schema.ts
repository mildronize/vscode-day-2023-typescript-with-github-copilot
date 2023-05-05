import { z } from 'zod';

export const envSchema = z.object({
  tmp: z.string().optional(),
});
