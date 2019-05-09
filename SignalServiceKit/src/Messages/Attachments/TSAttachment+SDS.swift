//
//  Copyright (c) 2019 Open Whisper Systems. All rights reserved.
//

import Foundation
import GRDBCipher
import SignalCoreKit

// NOTE: This file is generated by /Scripts/sds_codegen/sds_generate.py.
// Do not manually edit it, instead run `sds_codegen.sh`.

// MARK: - Record

public struct TSAttachmentRecord: Codable, FetchableRecord, PersistableRecord, TableRecord {
    public static let databaseTableName: String = TSAttachmentSerializer.table.tableName

    public let id: UInt64

    // This defines all of the columns used in the table
    // where this model (and any subclasses) are persisted.
    public let recordType: SDSRecordType
    public let uniqueId: String

    // Base class properties
    public let albumMessageId: String?
    public let attachmentSchemaVersion: UInt
    public let attachmentType: TSAttachmentType
    public let byteCount: UInt32
    public let caption: String?
    public let contentType: String
    public let encryptionKey: Data?
    public let isDownloaded: Bool
    public let serverId: UInt64
    public let sourceFilename: String?

    // Subclass properties
    public let cachedAudioDurationSeconds: Double?
    public let cachedImageHeight: Double?
    public let cachedImageWidth: Double?
    public let creationTimestamp: Date?
    public let digest: Data?
    public let isUploaded: Bool?
    public let isValidImageCached: Bool?
    public let isValidVideoCached: Bool?
    public let lazyRestoreFragmentId: String?
    public let localRelativeFilePath: String?
    public let mediaSize: Data?
    public let mostRecentFailureLocalizedText: String?
    public let pointerType: TSAttachmentPointerType?
    public let state: TSAttachmentPointerState?

    public enum CodingKeys: String, CodingKey, ColumnExpression, CaseIterable {
        case id
        case recordType
        case uniqueId
        case albumMessageId
        case attachmentSchemaVersion
        case attachmentType
        case byteCount
        case caption
        case contentType
        case encryptionKey
        case isDownloaded
        case serverId
        case sourceFilename
        case cachedAudioDurationSeconds
        case cachedImageHeight
        case cachedImageWidth
        case creationTimestamp
        case digest
        case isUploaded
        case isValidImageCached
        case isValidVideoCached
        case lazyRestoreFragmentId
        case localRelativeFilePath
        case mediaSize
        case mostRecentFailureLocalizedText
        case pointerType
        case state
    }

    public static func columnName(_ column: TSAttachmentRecord.CodingKeys) -> String {
        return column.rawValue
    }

}

// MARK: - StringInterpolation

public extension String.StringInterpolation {
    mutating func appendInterpolation(column: TSAttachmentRecord.CodingKeys) {
        appendLiteral(TSAttachmentRecord.columnName(column))
    }
}

// MARK: - Deserialization

// TODO: Remove the other Deserialization extension.
// TODO: SDSDeserializer.
// TODO: Rework metadata to not include, for example, columns, column indices.
extension TSAttachmentSerializer {
    // This method defines how to deserialize a model, given a
    // database row.  The recordType column is used to determine
    // the corresponding model class.
    class func deserializeRecord(record: TSAttachmentRecord) throws -> TSAttachment {

        switch record.recordType {
        case .attachment:

            let uniqueId: String = record.uniqueId
            let sortId: UInt64 = record.id
            let albumMessageId: String? = SDSDeserialization.optionalString(record.albumMessageId, name: "albumMessageId")
            let attachmentSchemaVersion: UInt = record.attachmentSchemaVersion
            let attachmentType: TSAttachmentType = record.attachmentType
            let byteCount: UInt32 = record.byteCount
            let caption: String? = SDSDeserialization.optionalString(record.caption, name: "caption")
            let contentType: String = record.contentType
            let encryptionKey: Data? = SDSDeserialization.optionalData(record.encryptionKey, name: "encryptionKey")
            let isDownloaded: Bool = record.isDownloaded
            let serverId: UInt64 = record.serverId
            let sourceFilename: String? = SDSDeserialization.optionalString(record.sourceFilename, name: "sourceFilename")

            return TSAttachment(uniqueId: uniqueId,
                                albumMessageId: albumMessageId,
                                attachmentSchemaVersion: attachmentSchemaVersion,
                                attachmentType: attachmentType,
                                byteCount: byteCount,
                                caption: caption,
                                contentType: contentType,
                                encryptionKey: encryptionKey,
                                isDownloaded: isDownloaded,
                                serverId: serverId,
                                sourceFilename: sourceFilename)

        case .attachmentPointer:

            let uniqueId: String = record.uniqueId
            let sortId: UInt64 = record.id
            let albumMessageId: String? = SDSDeserialization.optionalString(record.albumMessageId, name: "albumMessageId")
            let attachmentSchemaVersion: UInt = record.attachmentSchemaVersion
            let attachmentType: TSAttachmentType = record.attachmentType
            let byteCount: UInt32 = record.byteCount
            let caption: String? = SDSDeserialization.optionalString(record.caption, name: "caption")
            let contentType: String = record.contentType
            let encryptionKey: Data? = SDSDeserialization.optionalData(record.encryptionKey, name: "encryptionKey")
            let isDownloaded: Bool = record.isDownloaded
            let serverId: UInt64 = record.serverId
            let sourceFilename: String? = SDSDeserialization.optionalString(record.sourceFilename, name: "sourceFilename")
            let digest: Data? = SDSDeserialization.optionalData(record.digest, name: "digest")
            let lazyRestoreFragmentId: String? = SDSDeserialization.optionalString(record.lazyRestoreFragmentId, name: "lazyRestoreFragmentId")
            let mediaSizeSerialized: Data = record.mediaSize
            let mediaSize: CGSize = try SDSDeserializer.unarchive(mediaSizeSerialized)
            let mostRecentFailureLocalizedText: String? = SDSDeserialization.optionalString(record.mostRecentFailureLocalizedText, name: "mostRecentFailureLocalizedText")
            guard let pointerType: TSAttachmentPointerType = record.pointerType else {
               throw SDSError.missingRequiredField
            }
            guard let state: TSAttachmentPointerState = record.state else {
               throw SDSError.missingRequiredField
            }

            return TSAttachmentPointer(uniqueId: uniqueId,
                                       albumMessageId: albumMessageId,
                                       attachmentSchemaVersion: attachmentSchemaVersion,
                                       attachmentType: attachmentType,
                                       byteCount: byteCount,
                                       caption: caption,
                                       contentType: contentType,
                                       encryptionKey: encryptionKey,
                                       isDownloaded: isDownloaded,
                                       serverId: serverId,
                                       sourceFilename: sourceFilename,
                                       digest: digest,
                                       lazyRestoreFragmentId: lazyRestoreFragmentId,
                                       mediaSize: mediaSize,
                                       mostRecentFailureLocalizedText: mostRecentFailureLocalizedText,
                                       pointerType: pointerType,
                                       state: state)

        case .attachmentStream:

            let uniqueId: String = record.uniqueId
            let sortId: UInt64 = record.id
            let albumMessageId: String? = SDSDeserialization.optionalString(record.albumMessageId, name: "albumMessageId")
            let attachmentSchemaVersion: UInt = record.attachmentSchemaVersion
            let attachmentType: TSAttachmentType = record.attachmentType
            let byteCount: UInt32 = record.byteCount
            let caption: String? = SDSDeserialization.optionalString(record.caption, name: "caption")
            let contentType: String = record.contentType
            let encryptionKey: Data? = SDSDeserialization.optionalData(record.encryptionKey, name: "encryptionKey")
            let isDownloaded: Bool = record.isDownloaded
            let serverId: UInt64 = record.serverId
            let sourceFilename: String? = SDSDeserialization.optionalString(record.sourceFilename, name: "sourceFilename")
            let cachedAudioDurationSeconds: NSNumber? = SDSDeserialization.optionalDoubleAsNSNumber(record.cachedAudioDurationSeconds, name: "cachedAudioDurationSeconds")
            let cachedImageHeight: NSNumber? = SDSDeserialization.optionalDoubleAsNSNumber(record.cachedImageHeight, name: "cachedImageHeight")
            let cachedImageWidth: NSNumber? = SDSDeserialization.optionalDoubleAsNSNumber(record.cachedImageWidth, name: "cachedImageWidth")
            let creationTimestamp: Date = try SDSDeserialization.date(record.creationTimestamp, name: "creationTimestamp")
            let digest: Data? = SDSDeserialization.optionalData(record.digest, name: "digest")
            let isUploaded: Bool = try SDSDeserialization.bool(record.isUploaded, name: "isUploaded")
            let isValidImageCached: NSNumber? = SDSDeserialization.optionalBoolAsNSNumber(record.isValidImageCached, name: "isValidImageCached")
            let isValidVideoCached: NSNumber? = SDSDeserialization.optionalBoolAsNSNumber(record.isValidVideoCached, name: "isValidVideoCached")
            let localRelativeFilePath: String? = SDSDeserialization.optionalString(record.localRelativeFilePath, name: "localRelativeFilePath")

            return TSAttachmentStream(uniqueId: uniqueId,
                                      albumMessageId: albumMessageId,
                                      attachmentSchemaVersion: attachmentSchemaVersion,
                                      attachmentType: attachmentType,
                                      byteCount: byteCount,
                                      caption: caption,
                                      contentType: contentType,
                                      encryptionKey: encryptionKey,
                                      isDownloaded: isDownloaded,
                                      serverId: serverId,
                                      sourceFilename: sourceFilename,
                                      cachedAudioDurationSeconds: cachedAudioDurationSeconds,
                                      cachedImageHeight: cachedImageHeight,
                                      cachedImageWidth: cachedImageWidth,
                                      creationTimestamp: creationTimestamp,
                                      digest: digest,
                                      isUploaded: isUploaded,
                                      isValidImageCached: isValidImageCached,
                                      isValidVideoCached: isValidVideoCached,
                                      localRelativeFilePath: localRelativeFilePath)

        default:
            owsFailDebug("Unexpected record type: \(record.recordType)")
            throw SDSError.invalidValue
        }
    }
}

// MARK: - SDSSerializable

extension TSAttachment: SDSSerializable {
    public var serializer: SDSSerializer {
        // Any subclass can be cast to it's superclass,
        // so the order of this switch statement matters.
        // We need to do a "depth first" search by type.
        switch self {
        case let model as TSAttachmentStream:
            assert(type(of: model) == TSAttachmentStream.self)
            return TSAttachmentStreamSerializer(model: model)
        case let model as TSAttachmentPointer:
            assert(type(of: model) == TSAttachmentPointer.self)
            return TSAttachmentPointerSerializer(model: model)
        default:
            return TSAttachmentSerializer(model: self)
        }
    }
}

// MARK: - Table Metadata

extension TSAttachmentSerializer {

    // This defines all of the columns used in the table
    // where this model (and any subclasses) are persisted.
    static let recordTypeColumn = SDSColumnMetadata(columnName: "recordType", columnType: .int, columnIndex: 0)
    static let idColumn = SDSColumnMetadata(columnName: "id", columnType: .primaryKey, columnIndex: 1)
    static let uniqueIdColumn = SDSColumnMetadata(columnName: "uniqueId", columnType: .unicodeString, columnIndex: 2)
    // Base class properties
    static let albumMessageIdColumn = SDSColumnMetadata(columnName: "albumMessageId", columnType: .unicodeString, isOptional: true, columnIndex: 3)
    static let attachmentSchemaVersionColumn = SDSColumnMetadata(columnName: "attachmentSchemaVersion", columnType: .int64, columnIndex: 4)
    static let attachmentTypeColumn = SDSColumnMetadata(columnName: "attachmentType", columnType: .int, columnIndex: 5)
    static let byteCountColumn = SDSColumnMetadata(columnName: "byteCount", columnType: .int64, columnIndex: 6)
    static let captionColumn = SDSColumnMetadata(columnName: "caption", columnType: .unicodeString, isOptional: true, columnIndex: 7)
    static let contentTypeColumn = SDSColumnMetadata(columnName: "contentType", columnType: .unicodeString, columnIndex: 8)
    static let encryptionKeyColumn = SDSColumnMetadata(columnName: "encryptionKey", columnType: .blob, isOptional: true, columnIndex: 9)
    static let isDownloadedColumn = SDSColumnMetadata(columnName: "isDownloaded", columnType: .int, columnIndex: 10)
    static let serverIdColumn = SDSColumnMetadata(columnName: "serverId", columnType: .int64, columnIndex: 11)
    static let sourceFilenameColumn = SDSColumnMetadata(columnName: "sourceFilename", columnType: .unicodeString, isOptional: true, columnIndex: 12)
    // Subclass properties
    static let cachedAudioDurationSecondsColumn = SDSColumnMetadata(columnName: "cachedAudioDurationSeconds", columnType: .double, isOptional: true, columnIndex: 13)
    static let cachedImageHeightColumn = SDSColumnMetadata(columnName: "cachedImageHeight", columnType: .double, isOptional: true, columnIndex: 14)
    static let cachedImageWidthColumn = SDSColumnMetadata(columnName: "cachedImageWidth", columnType: .double, isOptional: true, columnIndex: 15)
    static let creationTimestampColumn = SDSColumnMetadata(columnName: "creationTimestamp", columnType: .int64, isOptional: true, columnIndex: 16)
    static let digestColumn = SDSColumnMetadata(columnName: "digest", columnType: .blob, isOptional: true, columnIndex: 17)
    static let isUploadedColumn = SDSColumnMetadata(columnName: "isUploaded", columnType: .int, isOptional: true, columnIndex: 18)
    static let isValidImageCachedColumn = SDSColumnMetadata(columnName: "isValidImageCached", columnType: .int, isOptional: true, columnIndex: 19)
    static let isValidVideoCachedColumn = SDSColumnMetadata(columnName: "isValidVideoCached", columnType: .int, isOptional: true, columnIndex: 20)
    static let lazyRestoreFragmentIdColumn = SDSColumnMetadata(columnName: "lazyRestoreFragmentId", columnType: .unicodeString, isOptional: true, columnIndex: 21)
    static let localRelativeFilePathColumn = SDSColumnMetadata(columnName: "localRelativeFilePath", columnType: .unicodeString, isOptional: true, columnIndex: 22)
    static let mediaSizeColumn = SDSColumnMetadata(columnName: "mediaSize", columnType: .blob, isOptional: true, columnIndex: 23)
    static let mostRecentFailureLocalizedTextColumn = SDSColumnMetadata(columnName: "mostRecentFailureLocalizedText", columnType: .unicodeString, isOptional: true, columnIndex: 24)
    static let pointerTypeColumn = SDSColumnMetadata(columnName: "pointerType", columnType: .int, isOptional: true, columnIndex: 25)
    static let stateColumn = SDSColumnMetadata(columnName: "state", columnType: .int, isOptional: true, columnIndex: 26)

    // TODO: We should decide on a naming convention for
    //       tables that store models.
    public static let table = SDSTableMetadata(tableName: "model_TSAttachment", columns: [
        recordTypeColumn,
        idColumn,
        uniqueIdColumn,
        albumMessageIdColumn,
        attachmentSchemaVersionColumn,
        attachmentTypeColumn,
        byteCountColumn,
        captionColumn,
        contentTypeColumn,
        encryptionKeyColumn,
        isDownloadedColumn,
        serverIdColumn,
        sourceFilenameColumn,
        cachedAudioDurationSecondsColumn,
        cachedImageHeightColumn,
        cachedImageWidthColumn,
        creationTimestampColumn,
        digestColumn,
        isUploadedColumn,
        isValidImageCachedColumn,
        isValidVideoCachedColumn,
        lazyRestoreFragmentIdColumn,
        localRelativeFilePathColumn,
        mediaSizeColumn,
        mostRecentFailureLocalizedTextColumn,
        pointerTypeColumn,
        stateColumn
        ])

}

// MARK: - Deserialization

extension TSAttachmentSerializer {
    // This method defines how to deserialize a model, given a
    // database row.  The recordType column is used to determine
    // the corresponding model class.
    class func sdsDeserialize(statement: SelectStatement) throws -> TSAttachment {

        if OWSIsDebugBuild() {
            guard statement.columnNames == table.selectColumnNames else {
                owsFailDebug("Unexpected columns: \(statement.columnNames) != \(table.selectColumnNames)")
                throw SDSError.invalidResult
            }
        }

        // SDSDeserializer is used to convert column values into Swift values.
        let deserializer = SDSDeserializer(sqliteStatement: statement.sqliteStatement)
        let recordTypeValue = try deserializer.int(at: 0)
        guard let recordType = SDSRecordType(rawValue: UInt(recordTypeValue)) else {
            owsFailDebug("Invalid recordType: \(recordTypeValue)")
            throw SDSError.invalidResult
        }
        switch recordType {
        case .attachment:

            let uniqueId = try deserializer.string(at: uniqueIdColumn.columnIndex)
            let albumMessageId = try deserializer.optionalString(at: albumMessageIdColumn.columnIndex)
            let attachmentSchemaVersion = UInt(try deserializer.int64(at: attachmentSchemaVersionColumn.columnIndex))
            let attachmentTypeRaw = UInt(try deserializer.int(at: attachmentTypeColumn.columnIndex))
            guard let attachmentType = TSAttachmentType(rawValue: attachmentTypeRaw) else {
               throw SDSError.invalidValue
            }
            let byteCount = UInt32(try deserializer.int64(at: byteCountColumn.columnIndex))
            let caption = try deserializer.optionalString(at: captionColumn.columnIndex)
            let contentType = try deserializer.string(at: contentTypeColumn.columnIndex)
            let encryptionKey = try deserializer.optionalBlob(at: encryptionKeyColumn.columnIndex)
            let isDownloaded = try deserializer.bool(at: isDownloadedColumn.columnIndex)
            let serverId = try deserializer.uint64(at: serverIdColumn.columnIndex)
            let sourceFilename = try deserializer.optionalString(at: sourceFilenameColumn.columnIndex)

            return TSAttachment(uniqueId: uniqueId,
                                albumMessageId: albumMessageId,
                                attachmentSchemaVersion: attachmentSchemaVersion,
                                attachmentType: attachmentType,
                                byteCount: byteCount,
                                caption: caption,
                                contentType: contentType,
                                encryptionKey: encryptionKey,
                                isDownloaded: isDownloaded,
                                serverId: serverId,
                                sourceFilename: sourceFilename)

        case .attachmentPointer:

            let uniqueId = try deserializer.string(at: uniqueIdColumn.columnIndex)
            let albumMessageId = try deserializer.optionalString(at: albumMessageIdColumn.columnIndex)
            let attachmentSchemaVersion = UInt(try deserializer.int64(at: attachmentSchemaVersionColumn.columnIndex))
            let attachmentTypeRaw = UInt(try deserializer.int(at: attachmentTypeColumn.columnIndex))
            guard let attachmentType = TSAttachmentType(rawValue: attachmentTypeRaw) else {
               throw SDSError.invalidValue
            }
            let byteCount = UInt32(try deserializer.int64(at: byteCountColumn.columnIndex))
            let caption = try deserializer.optionalString(at: captionColumn.columnIndex)
            let contentType = try deserializer.string(at: contentTypeColumn.columnIndex)
            let encryptionKey = try deserializer.optionalBlob(at: encryptionKeyColumn.columnIndex)
            let isDownloaded = try deserializer.bool(at: isDownloadedColumn.columnIndex)
            let serverId = try deserializer.uint64(at: serverIdColumn.columnIndex)
            let sourceFilename = try deserializer.optionalString(at: sourceFilenameColumn.columnIndex)
            let digest = try deserializer.optionalBlob(at: digestColumn.columnIndex)
            let lazyRestoreFragmentId = try deserializer.optionalString(at: lazyRestoreFragmentIdColumn.columnIndex)
            let mediaSizeSerialized: Data = try deserializer.blob(at: mediaSizeColumn.columnIndex)
            let mediaSize: CGSize = try SDSDeserializer.unarchive(mediaSizeSerialized)
            let mostRecentFailureLocalizedText = try deserializer.optionalString(at: mostRecentFailureLocalizedTextColumn.columnIndex)
            let pointerTypeRaw = UInt(try deserializer.int(at: pointerTypeColumn.columnIndex))
            guard let pointerType = TSAttachmentPointerType(rawValue: pointerTypeRaw) else {
               throw SDSError.invalidValue
            }
            let stateRaw = UInt(try deserializer.int(at: stateColumn.columnIndex))
            guard let state = TSAttachmentPointerState(rawValue: stateRaw) else {
               throw SDSError.invalidValue
            }

            return TSAttachmentPointer(uniqueId: uniqueId,
                                       albumMessageId: albumMessageId,
                                       attachmentSchemaVersion: attachmentSchemaVersion,
                                       attachmentType: attachmentType,
                                       byteCount: byteCount,
                                       caption: caption,
                                       contentType: contentType,
                                       encryptionKey: encryptionKey,
                                       isDownloaded: isDownloaded,
                                       serverId: serverId,
                                       sourceFilename: sourceFilename,
                                       digest: digest,
                                       lazyRestoreFragmentId: lazyRestoreFragmentId,
                                       mediaSize: mediaSize,
                                       mostRecentFailureLocalizedText: mostRecentFailureLocalizedText,
                                       pointerType: pointerType,
                                       state: state)

        case .attachmentStream:

            let uniqueId = try deserializer.string(at: uniqueIdColumn.columnIndex)
            let albumMessageId = try deserializer.optionalString(at: albumMessageIdColumn.columnIndex)
            let attachmentSchemaVersion = UInt(try deserializer.int64(at: attachmentSchemaVersionColumn.columnIndex))
            let attachmentTypeRaw = UInt(try deserializer.int(at: attachmentTypeColumn.columnIndex))
            guard let attachmentType = TSAttachmentType(rawValue: attachmentTypeRaw) else {
               throw SDSError.invalidValue
            }
            let byteCount = UInt32(try deserializer.int64(at: byteCountColumn.columnIndex))
            let caption = try deserializer.optionalString(at: captionColumn.columnIndex)
            let contentType = try deserializer.string(at: contentTypeColumn.columnIndex)
            let encryptionKey = try deserializer.optionalBlob(at: encryptionKeyColumn.columnIndex)
            let isDownloaded = try deserializer.bool(at: isDownloadedColumn.columnIndex)
            let serverId = try deserializer.uint64(at: serverIdColumn.columnIndex)
            let sourceFilename = try deserializer.optionalString(at: sourceFilenameColumn.columnIndex)
            let cachedAudioDurationSeconds = try deserializer.optionalDoubleAsNSNumber(at: cachedAudioDurationSecondsColumn.columnIndex)
            let cachedImageHeight = try deserializer.optionalDoubleAsNSNumber(at: cachedImageHeightColumn.columnIndex)
            let cachedImageWidth = try deserializer.optionalDoubleAsNSNumber(at: cachedImageWidthColumn.columnIndex)
            let creationTimestamp = try deserializer.date(at: creationTimestampColumn.columnIndex)
            let digest = try deserializer.optionalBlob(at: digestColumn.columnIndex)
            let isUploaded = try deserializer.bool(at: isUploadedColumn.columnIndex)
            let isValidImageCached = try deserializer.optionalBoolAsNSNumber(at: isValidImageCachedColumn.columnIndex)
            let isValidVideoCached = try deserializer.optionalBoolAsNSNumber(at: isValidVideoCachedColumn.columnIndex)
            let localRelativeFilePath = try deserializer.optionalString(at: localRelativeFilePathColumn.columnIndex)

            return TSAttachmentStream(uniqueId: uniqueId,
                                      albumMessageId: albumMessageId,
                                      attachmentSchemaVersion: attachmentSchemaVersion,
                                      attachmentType: attachmentType,
                                      byteCount: byteCount,
                                      caption: caption,
                                      contentType: contentType,
                                      encryptionKey: encryptionKey,
                                      isDownloaded: isDownloaded,
                                      serverId: serverId,
                                      sourceFilename: sourceFilename,
                                      cachedAudioDurationSeconds: cachedAudioDurationSeconds,
                                      cachedImageHeight: cachedImageHeight,
                                      cachedImageWidth: cachedImageWidth,
                                      creationTimestamp: creationTimestamp,
                                      digest: digest,
                                      isUploaded: isUploaded,
                                      isValidImageCached: isValidImageCached,
                                      isValidVideoCached: isValidVideoCached,
                                      localRelativeFilePath: localRelativeFilePath)

        default:
            owsFail("Invalid record type \(recordType)")
        }
    }
}

// MARK: - Save/Remove/Update

@objc
extension TSAttachment {
    public func anySave(transaction: SDSAnyWriteTransaction) {
        switch transaction.writeTransaction {
        case .yapWrite(let ydbTransaction):
            save(with: ydbTransaction)
        case .grdbWrite(let grdbTransaction):
            SDSSerialization.save(entity: self, transaction: grdbTransaction)
        }
    }

    // This method is used by "updateWith..." methods.
    //
    // This model may be updated from many threads. We don't want to save
    // our local copy (this instance) since it may be out of date.  We also
    // want to avoid re-saving a model that has been deleted.  Therefore, we
    // use "updateWith..." methods to:
    //
    // a) Update a property of this instance.
    // b) If a copy of this model exists in the database, load an up-to-date copy,
    //    and update and save that copy.
    // b) If a copy of this model _DOES NOT_ exist in the database, do _NOT_ save
    //    this local instance.
    //
    // After "updateWith...":
    //
    // a) Any copy of this model in the database will have been updated.
    // b) The local property on this instance will always have been updated.
    // c) Other properties on this instance may be out of date.
    //
    // All mutable properties of this class have been made read-only to
    // prevent accidentally modifying them directly.
    //
    // This isn't a perfect arrangement, but in practice this will prevent
    // data loss and will resolve all known issues.
    public func anyUpdateWith(transaction: SDSAnyWriteTransaction, block: (TSAttachment) -> Void) {
        guard let uniqueId = uniqueId else {
            owsFailDebug("Missing uniqueId.")
            return
        }

        guard let dbCopy = type(of: self).anyFetch(uniqueId: uniqueId,
                                                   transaction: transaction) else {
            return
        }

        block(self)
        block(dbCopy)

        dbCopy.anySave(transaction: transaction)
    }

    public func anyRemove(transaction: SDSAnyWriteTransaction) {
        switch transaction.writeTransaction {
        case .yapWrite(let ydbTransaction):
            remove(with: ydbTransaction)
        case .grdbWrite(let grdbTransaction):
            SDSSerialization.delete(entity: self, transaction: grdbTransaction)
        }
    }
}

// MARK: - TSAttachmentCursor

@objc
public class TSAttachmentCursor: NSObject {
    private let cursor: SDSCursor<TSAttachment>

    init(cursor: SDSCursor<TSAttachment>) {
        self.cursor = cursor
    }

    // TODO: Revisit error handling in this class.
    public func next() throws -> TSAttachment? {
        return try cursor.next()
    }

    public func all() throws -> [TSAttachment] {
        return try cursor.all()
    }
}

// MARK: - Obj-C Fetch

// TODO: We may eventually want to define some combination of:
//
// * fetchCursor, fetchOne, fetchAll, etc. (ala GRDB)
// * Optional "where clause" parameters for filtering.
// * Async flavors with completions.
//
// TODO: I've defined flavors that take a read transaction.
//       Or we might take a "connection" if we end up having that class.
@objc
extension TSAttachment {
    public class func grdbFetchCursor(transaction: GRDBReadTransaction) -> TSAttachmentCursor {
        return TSAttachmentCursor(cursor: SDSSerialization.fetchCursor(tableMetadata: TSAttachmentSerializer.table,
                                                                   transaction: transaction,
                                                                   deserialize: TSAttachmentSerializer.sdsDeserialize))
    }

    // Fetches a single model by "unique id".
    public class func anyFetch(uniqueId: String,
                               transaction: SDSAnyReadTransaction) -> TSAttachment? {
        assert(uniqueId.count > 0)

        switch transaction.readTransaction {
        case .yapRead(let ydbTransaction):
            return TSAttachment.fetch(uniqueId: uniqueId, transaction: ydbTransaction)
        case .grdbRead(let grdbTransaction):
            let tableMetadata = TSAttachmentSerializer.table
            let columnNames: [String] = tableMetadata.selectColumnNames
            let columnsSQL: String = columnNames.map { $0.quotedDatabaseIdentifier }.joined(separator: ", ")
            let tableName: String = tableMetadata.tableName
            let uniqueIdColumnName: String = TSAttachmentSerializer.uniqueIdColumn.columnName
            let sql: String = "SELECT \(columnsSQL) FROM \(tableName.quotedDatabaseIdentifier) WHERE \(uniqueIdColumnName.quotedDatabaseIdentifier) == ?"

            let cursor = TSAttachment.grdbFetchCursor(sql: sql,
                                                  arguments: [uniqueId],
                                                  transaction: grdbTransaction)
            do {
                return try cursor.next()
            } catch {
                owsFailDebug("error: \(error)")
                return nil
            }
        }
    }

    // Traverses all records.
    // Records are not visited in any particular order.
    // Traversal aborts if the visitor returns false.
    public class func anyVisitAll(transaction: SDSAnyReadTransaction, visitor: @escaping (TSAttachment) -> Bool) {
        switch transaction.readTransaction {
        case .yapRead(let ydbTransaction):
            TSAttachment.enumerateCollectionObjects(with: ydbTransaction) { (object, stop) in
                guard let value = object as? TSAttachment else {
                    owsFailDebug("unexpected object: \(type(of: object))")
                    return
                }
                guard visitor(value) else {
                    stop.pointee = true
                    return
                }
            }
        case .grdbRead(let grdbTransaction):
            do {
                let cursor = TSAttachment.grdbFetchCursor(transaction: grdbTransaction)
                while let value = try cursor.next() {
                    guard visitor(value) else {
                        return
                    }
                }
            } catch let error as NSError {
                owsFailDebug("Couldn't fetch models: \(error)")
            }
        }
    }

    // Does not order the results.
    public class func anyFetchAll(transaction: SDSAnyReadTransaction) -> [TSAttachment] {
        var result = [TSAttachment]()
        anyVisitAll(transaction: transaction) { (model) in
            result.append(model)
            return true
        }
        return result
    }
}

// MARK: - Swift Fetch

extension TSAttachment {
    public class func grdbFetchCursor(sql: String,
                                      arguments: [DatabaseValueConvertible]?,
                                      transaction: GRDBReadTransaction) -> TSAttachmentCursor {
        var statementArguments: StatementArguments?
        if let arguments = arguments {
            guard let statementArgs = StatementArguments(arguments) else {
                owsFail("Could not convert arguments.")
            }
            statementArguments = statementArgs
        }
        return TSAttachmentCursor(cursor: SDSSerialization.fetchCursor(sql: sql,
                                                             arguments: statementArguments,
                                                             transaction: transaction,
                                                                   deserialize: TSAttachmentSerializer.sdsDeserialize))
    }
}

// MARK: - SDSSerializer

// The SDSSerializer protocol specifies how to insert and update the
// row that corresponds to this model.
class TSAttachmentSerializer: SDSSerializer {

    private let model: TSAttachment
    public required init(model: TSAttachment) {
        self.model = model
    }

    public func serializableColumnTableMetadata() -> SDSTableMetadata {
        return TSAttachmentSerializer.table
    }

    public func insertColumnNames() -> [String] {
        // When we insert a new row, we include the following columns:
        //
        // * "record type"
        // * "unique id"
        // * ...all columns that we set when updating.
        return [
            TSAttachmentSerializer.recordTypeColumn.columnName,
            uniqueIdColumnName()
            ] + updateColumnNames()

    }

    public func insertColumnValues() -> [DatabaseValueConvertible] {
        let result: [DatabaseValueConvertible] = [
            SDSRecordType.attachment.rawValue
            ] + [uniqueIdColumnValue()] + updateColumnValues()
        if OWSIsDebugBuild() {
            if result.count != insertColumnNames().count {
                owsFailDebug("Update mismatch: \(result.count) != \(insertColumnNames().count)")
            }
        }
        return result
    }

    public func updateColumnNames() -> [String] {
        return [
            TSAttachmentSerializer.albumMessageIdColumn,
            TSAttachmentSerializer.attachmentSchemaVersionColumn,
            TSAttachmentSerializer.attachmentTypeColumn,
            TSAttachmentSerializer.byteCountColumn,
            TSAttachmentSerializer.captionColumn,
            TSAttachmentSerializer.contentTypeColumn,
            TSAttachmentSerializer.encryptionKeyColumn,
            TSAttachmentSerializer.isDownloadedColumn,
            TSAttachmentSerializer.serverIdColumn,
            TSAttachmentSerializer.sourceFilenameColumn
            ].map { $0.columnName }
    }

    public func updateColumnValues() -> [DatabaseValueConvertible] {
        let result: [DatabaseValueConvertible] = [
            self.model.albumMessageId ?? DatabaseValue.null,
            self.model.attachmentSchemaVersion,
            self.model.attachmentType.rawValue,
            self.model.byteCount,
            self.model.caption ?? DatabaseValue.null,
            self.model.contentType,
            self.model.encryptionKey ?? DatabaseValue.null,
            self.model.isDownloaded,
            self.model.serverId,
            self.model.sourceFilename ?? DatabaseValue.null

        ]
        if OWSIsDebugBuild() {
            if result.count != updateColumnNames().count {
                owsFailDebug("Update mismatch: \(result.count) != \(updateColumnNames().count)")
            }
        }
        return result
    }

    public func uniqueIdColumnName() -> String {
        return TSAttachmentSerializer.uniqueIdColumn.columnName
    }

    // TODO: uniqueId is currently an optional on our models.
    //       We should probably make the return type here String?
    public func uniqueIdColumnValue() -> DatabaseValueConvertible {
        // FIXME remove force unwrap
        return model.uniqueId!
    }
}
