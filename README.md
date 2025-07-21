
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
