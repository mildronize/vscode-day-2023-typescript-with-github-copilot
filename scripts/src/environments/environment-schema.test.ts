import test from 'ava';
import { Region, preprocessBoolean, preprocessEnv, preprocessRegion } from './environment-schema';

test('preprocessEnv', (t) => {
  t.is(preprocessEnv('dev'), 'dev');
  t.is(preprocessEnv('uat'), 'uat');
  t.throws(() => preprocessEnv('foo'), { message: "Expected 'dev' or 'uat', got foo" });
  t.throws(() => preprocessEnv(123), { message: 'Expected string, got number' });
});


test('preprocessRegion', (t) => {
  t.is(preprocessRegion('East Asia'), Region.EASTASIA);
  t.is(preprocessRegion('Australia East'), Region.AUSEAST);
  t.is(preprocessRegion('Southeast Asia'), Region.SEA);
  t.throws(() => preprocessRegion('foo'), { message: "Expected 'East Asia' or 'Australia East' or 'Southeast Asia', got foo" });
  t.throws(() => preprocessRegion(123), { message: 'Expected string, got number' });
});

test('preprocessBoolean', (t) => {
  t.is(preprocessBoolean('true'), true);
  t.is(preprocessBoolean('false'), false);
  t.throws(() => preprocessBoolean('foo'), { message: "Expected 'true' or 'false', got foo" });
  t.throws(() => preprocessBoolean(123), { message: 'Expected string, got number' });
});