import { AzureResource } from "./types";

export const resources: AzureResource[] = [];

let sea: AzureResource[] = [
    {
        env_name: 'dev',
        name: 'thadawvscode2023-dev-sea-web',
        service_type: 'web',
    },
    {
        env_name: 'dev',
        name: 'thadawvscode2023-dev-sea-api',
        service_type: 'api',
    },
    {
        env_name: 'dev',
        name: 'thadawvscode2023-dev-sea-mobile-api',
        service_type: 'mobile_api',
    },
];

sea = sea.map((resource) => ({
    ...resource,
    resource_group: 'rg-vscode2023-dev-sea',
}));

let eastasia: AzureResource[] = [
    {
        env_name: 'dev',
        name: 'thadawvscode2023-dev-eastasia-web',
        service_type: 'web',
    },
    {
        env_name: 'dev',
        name: 'thadawvscode2023-dev-eastasia-api',
        service_type: 'api',
    },
    {
        env_name: 'dev',
        name: 'thadawvscode2023-dev-eastasia-mobile-api',
        service_type: 'mobile_api',
    },
];

eastasia = eastasia.map((resource) => ({
    ...resource,
    resource_group: 'rg-vscode2023-dev-eastasia',
}));

let auseast: AzureResource[] = [
    {
        env_name: 'dev',
        name: 'thadawvscode2023-dev-auseast-web',
        service_type: 'web',
    },
    {
        env_name: 'dev',
        name: 'thadawvscode2023-dev-auseast-api',
        service_type: 'api',
    },
    {
        env_name: 'dev',
        name: 'thadawvscode2023-dev-auseast-mobile-api',
        service_type: 'mobile_api',
    },
];

auseast = auseast.map((resource) => ({
    ...resource,
    resource_group: 'rg-vscode2023-dev-auseast',
}));

export const devResources: AzureResource[] = [
    ...sea,
    ...eastasia,
    ...auseast,
].map((resource) => ({
    ...resource,
    scope: 'sea',
    subscription: 'Thada Public Talk',
}));
