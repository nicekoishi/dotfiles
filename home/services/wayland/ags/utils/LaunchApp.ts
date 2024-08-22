/* This function just passes command to execAsync, usage is the same
 * https://aylur.github.io/ags-docs/config/utils/
 */
const { execAsync } = Utils;

export default (command: string | string[]) => {
    const first = Array.isArray(command) ? command[0] : command;

    try {
        execAsync(command);
    } catch (error) {
        console.warn(`${first}: '${error}'`);
    }
};
