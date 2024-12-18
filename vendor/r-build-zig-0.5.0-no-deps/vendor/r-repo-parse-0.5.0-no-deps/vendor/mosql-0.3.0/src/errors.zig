const c = @import("c.zig").c;

/// Just the SQLite3 primary errors.
pub const Error = error{
    // https://www.sqlite.org/rescode.html
    Ok,
    Abort,
    Auth,
    Busy,
    CantOpen,
    Constraint,
    Corrupt,
    Done,
    Empty,
    Error,
    Format,
    Full,
    Internal,
    Interrupt,
    IoErr,
    Locked,
    Mismatch,
    Misuse,
    NoLfs,
    NoMem,
    NotADb,
    NotFound,
    Notice,
    Perm,
    Protocol,
    Range,
    ReadOnly,
    Row,
    Schema,
    TooBig,
    Warning,
};

/// Return the primary type of the result code. See
/// https://www.sqlite.org/rescode.html.
pub fn rc_to_error(rc: c_int) Error {
    return switch (rc & 0xff) {
        c.SQLITE_ABORT => Error.Abort,
        c.SQLITE_AUTH => Error.Auth,
        c.SQLITE_BUSY => Error.Busy,
        c.SQLITE_CANTOPEN => Error.CantOpen,
        c.SQLITE_CONSTRAINT => Error.Constraint,
        c.SQLITE_CORRUPT => Error.Corrupt,
        c.SQLITE_DONE => Error.Done,
        c.SQLITE_EMPTY => Error.Empty,
        c.SQLITE_ERROR => Error.Error,
        c.SQLITE_FORMAT => Error.Format,
        c.SQLITE_FULL => Error.Full,
        c.SQLITE_INTERNAL => Error.Internal,
        c.SQLITE_INTERRUPT => Error.Interrupt,
        c.SQLITE_IOERR => Error.IoErr,
        c.SQLITE_LOCKED => Error.Locked,
        c.SQLITE_MISMATCH => Error.Mismatch,
        c.SQLITE_MISUSE => Error.Misuse,
        c.SQLITE_NOLFS => Error.NoLfs,
        c.SQLITE_NOMEM => Error.NoMem,
        c.SQLITE_NOTADB => Error.NotADb,
        c.SQLITE_NOTFOUND => Error.NotFound,
        c.SQLITE_NOTICE => Error.Notice,
        c.SQLITE_OK => Error.Ok,
        c.SQLITE_PERM => Error.Perm,
        c.SQLITE_PROTOCOL => Error.Protocol,
        c.SQLITE_RANGE => Error.Range,
        c.SQLITE_READONLY => Error.ReadOnly,
        c.SQLITE_ROW => Error.Row,
        c.SQLITE_SCHEMA => Error.Schema,
        c.SQLITE_TOOBIG => Error.TooBig,
        c.SQLITE_WARNING => Error.Warning,
        else => unreachable,
    };
}
