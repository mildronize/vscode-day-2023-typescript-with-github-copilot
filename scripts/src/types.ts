
export interface FlattenAzureResource {
  env_name?: string;
  name?: string;
  resource_group?: string;
  subscription?: string;
  resource_type?: 'app_service';
  service_type?: 'web' | 'api' | 'mobile_api';
  scope?: 'sea' | 'eastasia' | 'auseast';
}

type Matrix = FlattenAzureResource[];


