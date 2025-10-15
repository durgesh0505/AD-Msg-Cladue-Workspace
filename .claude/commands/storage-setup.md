Configure Azure Storage Account with containers, lifecycle policies, and security settings.

## Usage

```bash
/storage-setup "[storage account configuration requirements]"
```

## Examples

**Basic Setup**:
```bash
/storage-setup "Create storage account 'mystorageaccount' in eastus with 3 blob containers: uploads, processed, archive"
```

**With Lifecycle Management**:
```bash
/storage-setup "Create storage with lifecycle policy: move to cool tier after 30 days, archive after 90 days, delete after 365 days"
```

**With Security**:
```bash
/storage-setup "Create storage with private endpoint, disable public access, enable blob versioning and soft delete"
```

## Features Generated

- Storage account creation with optimal SKU
- Blob containers with access levels
- Lifecycle management policies
- CORS configuration
- SAS token generation
- Connection string output
- Security hardening (encryption, private endpoints)

## Integration

Uses Context7 for latest Azure Storage features and best practices.
