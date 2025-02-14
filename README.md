# Linked Text Widget

A Flutter widget that simplifies the creation of text with clickable links, designed with localization in mind.

## Why use this?

When creating text with clickable links in Flutter, common approaches include:
- Using WebViews
- Using the full Markdown library
- Manually wrapping text in RichText widgets

These approaches can be cumbersome, especially when dealing with localization. This widget provides a simpler solution that:
- Maintains clean, localizable text strings
- Handles link detection and styling automatically
- Avoids the overhead of WebViews or full Markdown parsing
- Provides type-safe link handling

## Usage

Add the package to your `pubspec.yaml`:

```yaml
dependencies:
  linked_text: ^1.0.0
```

Basic usage example:

```dart
LinkedText(
  text: 'Click [here](https://example.com) to visit our website',
  onTap: (link) {
    // Handle the link tap
    launchUrl(Uri.parse(link));
  },
)
```

### Localization Example

Works seamlessly with your localization system:

```dart
LinkedText(
  text: AppLocalizations.of(context).linkedMessage, // "Visit our [website](https://example.com)"
  onTap: (link) => launchUrl(Uri.parse(link)),
)
```

## Features

- Simple Markdown-style link syntax: `[link text](link target)`
- Customizable link styling
- Type-safe link handling
- Localization-friendly
- Lightweight implementation
- Fully tested

## License

[Add your license information here]
