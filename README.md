# MacNewFile
MacOS finder's new file plugin, supporting user defined new file template.

!!! This is a fork of [fateleak/macnewfile](https://github.com/fateleak/macnewfile) !!!

### Changes

- File Icons show up in the drop-down
- Added shortcut to the template folder in the drop-down
- Files now automatically get selected, so Finder will automatically scroll to the newly created file
- Renaming when file still exists now reflects the default Finder behavior like this:
  - test.txt
  - test copy.txt
  - test copy 2.txt
  - ...
- Rewritten a lot of stuff and updated the code to swift 4
- Removed some files that aren't needed anymore

### Build

- Open the Xcode project and build it
- Move the App to the Applications Folder
- Activate the Finder Extension in the Settings
- Add Toolbar Icon inside Finder

## How to use

- Just add any files you wanna see in the drop-down list to the template folder
- You can easily access the template folder by clicking "open template folder" in the drop-down

## Liscense

DO WHAT EVER YOU WANT WITH NO WARRANTY







