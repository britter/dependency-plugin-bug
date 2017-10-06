# dependency-plugin-bug

Demo project demonstrating a bug in the maven dependency plugin.
The [documentation](https://maven.apache.org/plugins/maven-dependency-plugin/go-offline-mojo.html) of the go-offline goal states:

> Goal that resolves all project dependencies, including plugins and reports and their dependencies.

So it should be possible to call the go-offline goal and from there on work with Maven only in offline mode (`-o`).
The `build.sh` script demonstrates that this currently does not work. The script does the following:

- Set the MAVEN_OPTS environment variable to point to this `<this directoy>/.m2`
- call `mvn dependency:go-offline`
- call `mvn -o compile`

The build fails with:

```
[ERROR] Failed to execute goal org.apache.maven.plugins:maven-resources-plugin:2.6:resources (default-resources) on project dependency-plugin-bug: Execution default-resources of goal org.apache.maven.plugins:maven-resources-plugin:2.6:resources failed: Plugin org.apache.maven.plugins:maven-resources-plugin:2.6 or one of its dependencies could not be resolved: The following artifacts could not be resolved: org.apache.maven:maven-profile:jar:2.0.6, org.apache.maven:maven-repository-metadata:jar:2.0.6, org.apache.maven:maven-plugin-registry:jar:2.0.6, classworlds:classworlds:jar:1.1-alpha-2: Cannot access central (https://repo.maven.apache.org/maven2) in offline mode and the artifact org.apache.maven:maven-profile:jar:2.0.6 has not been downloaded from it before. -> [Help 1]
```

## Solution

The dependency plugin has a bug, or more precisely the version used: 2.8.

Switching to latest 3.0.1 fixes the issue.

## Contribution policy

Contributions via GitHub pull requests are gladly accepted from their original author. Along with any pull requests, please state that the contribution is your original work and that you license the work to the project under the project's open source license. Whether or not you state this explicitly, by submitting any copyrighted material via pull request, email, or other means you agree to license the material under the project's open source license and warrant that you have the legal authority to do so.

## License

This code is open source software licensed under the [Apache 2.0 License](https://www.apache.org/licenses/LICENSE-2.0.html).
