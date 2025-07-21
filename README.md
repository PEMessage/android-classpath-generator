
# android-classpath-generator

This repo is intended for users who are having trouble getting Android projects to work with JDTLS.
Thanksfully `init.gradle` come from JDTLS could also work standalone, only need some minor tweaks.

## `classpathgen.sh`


### Usage:

```bash
./gradlew -I init.gradle eclipse
```

or

```bash
./classpathgen.sh
```

To update the `init.gradle` file:

```bash
./classpathgen.sh -u
```

After generate classpath, disable JDTLS update classpath(always do it manually by ourself)
```lua
init_options = {
    settings = {
        java = {
            import = {
                gradle = {
                    -- See: https://www.reddit.com/r/neovim/comments/1m3v9kk/jdtls_keeps_regenerating_my_classpath_for_a/
                    -- do not let jdtls generate .classpath, manually generate it
                    enabled = false,
                },
            },
        },
    },
},
```
and clean cache if you need 
```bash
rm ~/.cache/jdtls/workspace/.metadata -rf  
```
now android project should work well with jdtls
