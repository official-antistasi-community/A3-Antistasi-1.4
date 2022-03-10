const arguments = process.argv.slice(2);

const fs = require('fs');
const { spawnSync } = require("child_process")

//git actions
const pathScriptVersion = 'A3A/addons/core/Includes/script_version.hpp';
const gitAdd = () => spawnSync("git", ["add", pathScriptVersion])
const gitCommit = () => spawnSync("git", ["commit", `-m 'Automated version bump'`])
const gitCurrCommit = () => spawnSync("git", ["rev-parse", "--short", "HEAD"]);

//argument validation
const validArguments = [
      '-b', '-build'
    , '-p', '-patch'
    , '-min', '-minor'
    , '-maj', '-major'
]
let buildV = gitCurrCommit().stdout.toString();

const invalidArguments = arguments.filter(n => !validArguments.includes(n));
let blockRunning = false;
if ((invalidArguments.length !== 0)) {
    invalidArguments.forEach(e => {
        let index = arguments.indexOf('-b')
        let indexElement = arguments.indexOf(e);
        if (index === -1 || (index +1 ) !== indexElement || e.length < 7) {
            console.error(`Unknown arguments detected: ${invalidArguments}`);
            blockRunning = true;
        } else {
            buildV = e;
        }
    });
}
if (blockRunning) return;
console.debug('argument validation passed\n\n');

//incrementing functionnality
function incrementMajor() { curMajor++; incrementMinor(true); };
function incrementMinor(reset = false)  { reset ? curMinor = 0 : curMinor++; incrementPatch(true); };
function incrementPatch(reset = false)  { reset ? curPatch = 0 : curPatch++; };
function incrementBuild() { curBuild = buildV.substring(0,7); };

let scriptVersion = fs.readFileSync(pathScriptVersion);

//exstract current version
let index = scriptVersion.indexOf('#define MAJOR') + 14;
let eol = scriptVersion.indexOf('\n', index);
let curMajor = parseInt(scriptVersion.slice(index, eol).toString());

index = scriptVersion.indexOf('#define MINOR') + 14;
eol = scriptVersion.indexOf('\n', index);
let curMinor = parseInt(scriptVersion.slice(index, eol).toString());

index = scriptVersion.indexOf('#define PATCHLVL') + 17;
eol = scriptVersion.indexOf('\n', index);
let curPatch = parseInt(scriptVersion.slice(index, eol).toString());

index = scriptVersion.indexOf('#define BUILD') + 14;
let curBuild = scriptVersion.slice(index).toString();


//main logic
if (arguments.includes('-b'||'-build')) {
    console.debug('incrementing build');
    incrementBuild();
};

if (arguments.includes('-p'||'-patch')) {
    console.debug('incrementing Patch');
    incrementPatch();
};

if (arguments.includes('-min'||'-minor')) {
    console.debug('incrementing Minor');
    incrementMinor();
};

if (arguments.includes('-maj'||'-major')) {
    console.debug('incrementing Major');
    incrementMajor();
};

//update script_version.hpp
let line = `#define MAJOR ${curMajor}\n#define MINOR ${curMinor}\n#define PATCHLVL ${curPatch}\n#define BUILD ${curBuild}`;
fs.writeFileSync(pathScriptVersion,line)
console.debug(line);

/*
gitAdd();
gitCommit();
*/
