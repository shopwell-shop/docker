# Shopwell repository rules

This repository is the independently maintained Shopwell production image project.

- Preserve UTF-8 and existing user changes.
- Shopwell-owned code and the Composer manifest use the Apache License 2.0 (`Apache-2.0`); root `LICENSE` contains the standard text.
- Preserve every upstream legal text verbatim in root `NOTICE`.
- Outside `NOTICE`, do not reintroduce Shopware branding, package names, repositories, images, or Actions.
- Publish Shopwell images only under Shopwell-controlled GHCR and Docker Hub namespaces.
- Never print registry credentials or commit them to files. Keep them in GitHub Actions secrets.
- Do not merge or cherry-pick unrelated upstream history, copy upstream tags, or force-push.
- Before commit, push, release, or sync completion, run:
  `../sync-upstream/bin/syncctl audit-license docker` and
  `../sync-upstream/bin/syncctl audit-upstream-dependencies docker`.
- A failed audit blocks completion.
