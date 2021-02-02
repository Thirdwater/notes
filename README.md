# Notes

Personal notes using asciidoc and github pages.

## CI/CD

Simply push changes in the `asciidocs/` directory to the GitHub `main` branch.

## Testing Locally

### Setup

```sh
apt-get install -y asciidoctor python
gem install pygments.rb
```

### Generating HTML Output

```sh
cd /path/to/notes
mkdir docs
asciidoctor asciidocs/index.adoc --destination-dir docs
```

Check output at `docs/index.html` on a local browser.

## Resources

### Writing and Editing

* [AsciiDoc Recommended Practices](https://asciidoctor.org/docs/asciidoc-recommended-practices/)

### Syntax and Infrastructure

* [AsciiDoc Language Documentation](https://docs.asciidoctor.org/asciidoc/latest/)
* [Asciidoctor Documentation](https://docs.asciidoctor.org/asciidoctor/latest/)
* [GitHub Actions Documentation](https://docs.github.com/en/actions)
