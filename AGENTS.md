# Project instructions

rstack is a general-purpose collection of Agent Skills, assembled one Skill at a time around actual needs.

## Documentation

- Provide English and Chinese project documentation as same-directory `name.md` and `name.zh.md` pairs.
- Keep translations and reciprocal links aligned.
- Describe actual behavior. Update affected usage commands when tooling changes.
- Use document-relative paths for local Markdown links.

## Development

Prepare the tools:

```bash
pnpm install --frozen-lockfile
pnpm hooks:install
```

- Run `pnpm check` after changes.
- Use `pnpm docs:format` to format Markdown.
- For changes to Skill behavior, exercise the actual invocation and usage paths. Record the scenarios and observed results.

## Git

- Use trunk-based development.
- Ensure `main` maintains a linear history.
- `main` is the long-lived branch. After the first commit, make subsequent changes on short-lived branches created from `main`.
- Write commit messages in English using Conventional Commits.
- Use types from the standard set.
- Commit hooks format staged files and validate commit messages.

## Boundary

- Limit changes to the requested capability or fix. Do not prebuild for hypothetical requirements.
- Do not track local directories, sensitive information, credentials, private hostnames, internal service URLs, or the device's model, provider, or channel configuration.
